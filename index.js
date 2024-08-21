const puppeteer = require('puppeteer');

(async () => {
  try {
    // Launch Chromium
    const browser = await puppeteer.launch({
      headless: true, // Set to false if you want to see the browser window
      args: ['--no-sandbox', '--disable-setuid-sandbox']
    });

    // Open a new page
    const page = await browser.newPage();

    // Navigate to a website
    await page.goto('https://example.com');

    // Print the page title
    const title = await page.title();
    console.log(`Page title: ${title}`);

    // Close the browser
    await browser.close();
  } catch (error) {
    console.error('Error:', error);
  }
})();
