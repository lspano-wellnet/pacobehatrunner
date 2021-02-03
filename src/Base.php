<?php
use Symfony\Component\Yaml\Yaml;
use Symfony\Component\Yaml\Exception\ParseException;

class Base {

    public function printBehatYml($brand, $country) {
        $featureBrandPath = $this->featureBrandPath($brand);
        $countryMapped = $this->getCountry($country);
        // String containing Country_Brand_Envoirment string
        $countryBrandEnvString = $countryMapped ."_" . $featureBrandPath[1] . "_" . $this->getBrowserstackInfo('default_env');
        $i = "default:
  extensions:
    Vanare\BehatCucumberJsonFormatter\Extension:
      outputDir: %paths.base%/artifacts
    Behat\MinkExtension\ServiceContainer\MinkExtension:
      base_url: \"\"
      sessions:
        browser_stack:
          browser_stack:
            username: \"" . $this->getBrowserstackInfo('username') . "\"
            access_key: \"" . $this->getBrowserstackInfo('access_key') . "\"
            capabilities: {\"browser\" :\"Chrome\", \"os\": \"OS X\", \"os_version\": \"Catalina\", \"resolution\": \"1920x1080\", \"acceptSslCerts\": true, \"project\": \"maxmara_automation\", \"build\": \"" . $this->getCurrentDateItaly() . " " . $countryBrandEnvString . "\"}
        local:
          selenium2:
          
            wd_host: 'http://phantomjs:4444/wd/hub'
            capabilities: { \"browser\": \"phantomjs\", \"version\" : \"xx.xx\"}

  suites:
        TSF050:
          paths: [ %paths.base%/features/features_" . $featureBrandPath[0] . "/TSF050-utils ]
          contexts:
            - " . $featureBrandPath[1] . "TSF002Context:
                - " . $countryBrandEnvString;
        file_put_contents('../behat.yml', $i);
    }


    public function printConfigFile($brand, $country) {
        $today = $this->getCurrentDateItaly();
        $featureBrandPath = $this->featureBrandPath($brand);
        $countryMapped = $this->getCountry($country);
        $i = "options:
  project: \"PACO " . $today . "\"
  acceptSslCerts: true
  username: \"" . $this->getBrowserstackInfo('username') . "\"
  accessKey: \"" . $this->getBrowserstackInfo('access_key') . "\"
  dockerNetwork: \"tests_default\"
  phantomjsUrl: \"http://phantomjs:4444/wd/hub\"
  debug: true
plans:
  - description: \"" . $featureBrandPath[1] . " " . $countryMapped . " " . $today . "\"
    basePath: \"/data/maxmara_dd_test/tests/\"
    featuresFolder: \"features/features_" . $featureBrandPath[0] . "/\"
    bootstrapFolder: \"features/bootstrap/\"
    outputFolder: \"artifacts/runs/\"
    testList: \"data/automatic_tests_list_" . $featureBrandPath[0] . "_PACO.csv\"
    runnerType: \"host\"
    buildId : \"\"
    store: \"" . $countryMapped . "_" . $featureBrandPath[1] . "_" . $this->getBrowserstackInfo('default_env') . "\"
    countryOutline: true
    capabilities:
      - type: \"desktop\"
        os: \"Windows\"
        osVersion: \"10\"
        browser: \"Chrome\"
        browserVersion: \"80.0\"
        resolution: \"1920x1080\"
        device: \"\"
        extraCapabilities: \"{}\"
        note: \"\"";
        file_put_contents('../data/config.yml', $i);
    }

    public function featureBrandPath($brand) {
        switch ($brand){
            case "mm":
                return ["maxmara", "Maxmara"];
                break;
            case "dt":
                return ["intrend", "Intrend"];
                break;
            case "mr":
                return ["marinarinaldi", "MarinaRinaldi"];
                break;
            case "pb":
                return ["pennyblack", "PennyBlack"];
                break;
            case "sp":
                return ["sportmax", "Sportmax"];
                break;
            case "ma":
                return ["marella", "Marella"];
                break;
            case "fm":
                return ["fashionmarket", "FashionMarket"];
                break;
            case "we":
                return ["weekend", "Weekend"];
                break;
        }
    }

    public function getCountry($country) {
        $yaml = Yaml::parse(file_get_contents('src/countries.yml'));
        return $yaml['countries'][$country];
    }

    private function getBrowserstackInfo($param){
        $yaml = Yaml::parse(file_get_contents('src/config.yml'));
        return $yaml['browserstack'][$param];
    }

    public function getCurrentDateItaly() {
        date_default_timezone_set("Europe/Rome");
        return strftime("%Y/%m/%d");
    }
}