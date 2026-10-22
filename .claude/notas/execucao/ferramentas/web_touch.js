const { chromium } = require('playwright');
const http = require('http'), fs = require('fs'), path = require('path');
const types = {'.html':'text/html','.js':'application/javascript','.wasm':'application/wasm','.pck':'application/octet-stream','.png':'image/png'};
function serve(dir, port){ return http.createServer((q,r)=>{ let f=path.join(dir, q.url.split('?')[0]==='/'?'index.html':q.url.split('?')[0]); fs.readFile(f,(e,d)=>{ if(e){r.writeHead(404);r.end();return;} r.writeHead(200,{'Content-Type':types[path.extname(f)]||'application/octet-stream'}); r.end(d);});}).listen(port); }
(async()=>{
  for (const [name, port] of [['dbefore',8701],['dafter',8702]]) {
    const srv = serve(process.env.S+'/'+name+'-web', port);
    const b = await chromium.launch({executablePath:'/opt/pw-browsers/chromium-1194/chrome-linux/chrome', args:['--use-gl=swiftshader','--enable-unsafe-swiftshader']});
    const ctx = await b.newContext({viewport:{width:390,height:844}, deviceScaleFactor:1, isMobile:true, hasTouch:true});
    const p = await ctx.newPage();
    await p.goto('http://localhost:'+port+'/');
    await p.waitForTimeout(9000);
    await p.screenshot({path:process.env.S+'/pw/'+name+'-0.png'});
    const cdp = await ctx.newCDPSession(p);
    for (let k=0;k<4;k++){
      const x=195, y0=600, y1=250;
      await cdp.send('Input.dispatchTouchEvent',{type:'touchStart',touchPoints:[{x,y:y0}]});
      for(let i=1;i<=12;i++){ await cdp.send('Input.dispatchTouchEvent',{type:'touchMove',touchPoints:[{x,y:y0+(y1-y0)*i/12}]}); await p.waitForTimeout(16);}
      await cdp.send('Input.dispatchTouchEvent',{type:'touchEnd',touchPoints:[]});
      await p.waitForTimeout(400);
    }
    await p.screenshot({path:process.env.S+'/pw/'+name+'-1.png'});
    await b.close(); srv.close();
  }
})();
