const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({
    headless: false,
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  const page = await browser.newPage();
  await page.goto('https://www.google.com');
  
  // Keep the browser open
  await page.waitForTimeout(60000); // Keeps the browser open for 60 seconds

  // Uncomment below line if you want to close the browser after a period
  // await browser.close();
})();
