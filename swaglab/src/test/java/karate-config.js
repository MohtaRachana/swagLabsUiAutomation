//function fn() {
	//var env = karate.env; // get system property 'karate.env'
	//karate.log('karate.env system property was:', env);
	//if (!env) {
	//	env = 'dev';
	//}
	//var config = {
	//	env: env,
	//	myVarName: 'someValue'
	//}
	//if (env == 'dev') {
	//	config.baseUrl = "https://www.saucedemo.com/"
	//	config.homePageUrl = "https://www.saucedemo.com/inventory.html"
	//} else if (env == 'e2e') {
	//	// customize
	//}
	//karate.configure('driver', { type: 'chrome' });
//		return config;
//}
function fn() {
  var config = {
    baseUrl: 'https://www.saucedemo.com/'
  };

  if (karate.env === 'ci') {
    var port = karate.properties['karate.remote.port'];
    config.driver = { type: 'chrome', start: true, addOptions: ['--incognito'], webDriverUrl: 'http://localhost:' + port + '/json' };
  }

  return config;
}
	
