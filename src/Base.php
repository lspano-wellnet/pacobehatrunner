<?php
use Symfony\Component\Yaml\Yaml;
use Symfony\Component\Yaml\Exception\ParseException;

class Base {

    public function printBehatYml($brand, $country) {
        $featureBrandPath = $this->featureBrandPath($brand);
        $countryMapped = $this->getCountry($country);
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
            capabilities: {\"browser\" :\"Chrome\", \"browserVersion\": \"80\", \"os\": \"windows\", \"os_version\": \"10\", \"resolution\": \"1920x1080\", \"acceptSslCerts\": true, \"browserstack-debug\": true, \"project\": \"maxmara_automation\", \"build\": \"" . $this->getBrowserstackInfo('default_env') . "\"}
        local:
          selenium2:
            wd_host: 'http://phantomjs:4444/wd/hub'
            capabilities: { \"browser\": \"phantomjs\", \"version\" : \"xx.xx\"}

  suites:
        TSF050:
          paths: [ %paths.base%/features/features_" . $featureBrandPath[0] . "/TSF050-utils ]
          contexts:
            - " . $featureBrandPath[1] . "TSF002Context:
                - " . $countryMapped ."_" . $featureBrandPath[1] . "_" . $this->getBrowserstackInfo('default_env');
        file_put_contents('../behat.yml', $i);
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
            case "sp" || "spx":
                return ["sportmax", "SportMax"];
                break;
            case "ma":
                return ["marella", "Marella"];
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
}