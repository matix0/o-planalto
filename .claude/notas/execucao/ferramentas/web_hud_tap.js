const { chromium } = require('playwright');
const http = require('http'), fs = require('fs'), path = require('path');
const types = {'.html':'text/html','.js':'application/javascript','.wasm':'application/wasm','.pck':'application/octet-stream','.png':'image/png'};
function serve(dir, port){ return http.createServer((q,r)=>{ let u=q.url.split('?')[0]; let f=path.join(dir, u==='/'?'index.html':u); fs.readFile(f,(e,d)=>{ if(e){r.writeHead(404);r.end();return;} r.writeHead(200,{'Content-Type':types[path.extname(f)]||'application/octet-stream'}); r.end(d);});}).listen(port); }
(async()=>{
  for (const [name, port] of [['hb1',8711],['ha1',8712]]) {
    const srv = serve(process.env.S+'/'+name+'-web', port);
    const b = await chromium.launch({executablePath:'/opt/pw-browsers/chromium-1194/chrome-linux/chrome', args:['--use-gl=swiftshader','--enable-unsafe-swiftshader']});
    const ctx = await b.newContext({viewport:{width:390,height:844}, isMobile:true, hasTouch:true});
    const p = await ctx.newPage();
    await p.goto('http://localhost:'+port+'/'); await p.waitForTimeout(9000);
    await p.touchscreen.tap(40, 78);   // first meter (Dignidade)
    await p.waitForTimeout(700);
    console.log(name, 'legend after tap:', JSON.stringify(await p.title()));
    await p.screenshot({path:process.env.S+'/pw/'+name+'-tap.png'});
    await p.touchscreen.tap(40, 78); await p.waitForTimeout(700);
    console.log(name, 'after 2nd tap:', JSON.stringify(await p.title()));
    await b.close(); srv.close();
  }
})();
