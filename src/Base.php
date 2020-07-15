<?php
use Symfony\Component\Yaml\Yaml;
use Symfony\Component\Yaml\Exception\ParseException;

class Base {
    public $config = [
        'options' =>
            [
                'project' => "TEST",
                'acceptSslCerts' => true,
                'username' => "wellnetsrl1",
                'accessKey' => "QNyizzioNqWWQWcxV66p",
                'dockerNetwork' => "tests_default",
                'phantomjsUrl' => "http' =>  //phantomjs' =>  4444/wd/hub",
                'debug' => true
            ],
        'plans' =>
            [
                'description' => "Marina Rinaldi Italy store",
                'basePath' => "/data/maxmara_dd_test/tests/",
                'featuresFolder' => "features/features_sportmax/",
                'bootstrapFolder' => "features/bootstrap/",
                'outputFolder' => "artifacts/runs/",
                'testList' => "data/automatic_tests_list_sportmax_PACO.csv",
                'runnerType' => "host",
                'buildId ' => "",
                'store' => "Italy_Sportmax_UAT",
                'countryOutline' => true,
                'capabilities' =>
                    [
                        'type' => "desktop",
                        'os' => "Windows",
                        'osVersion' => "10",
                        'browser' => "Chrome",
                        'browserVersion' => "80.0",
                        'resolution' => "1920x1080",
                        'device' => "",
                        'extraCapabilities' => "{}",
                        'note' => ""
                    ]
            ],
    ];

    public $behat = [
        'default' => [
            'extensions' => [
                'Vanare\BehatCucumberJsonFormatter\Extension' => [
                    'outputDir' => '%paths.base%/artifacts',
                ],
                'Behat\MinkExtension\ServiceContainer\MinkExtension' => [
                    'base_url' => '',
                    'sessions' => [
                        'browser_stack' => [
                            'browser_stack' => [
                                'username' => "qasupport4",
                                'access_key' => "EKPbquBzpXZcfqMjyVYu",
                                'capabilities' =>
                                    '{"browser":"Chrome", "browserVersion": "80", "os": "windows", "os_version": "10", "resolution": "1920x1080", "acceptSslCerts": true, "browserstack-debug": true, "project": "maxmara_automation", "build": "MAXMARA_AUTO_TESTS_LSPANO"}'
                            ]
                        ],
                        'local' => [
                            'selenium2' => [
                                'wd_host' => 'http://phantomjs:4444/wd/hub',
                                'capabilities' => '{ "browser": "phantomjs", "version": "xx.xx"}'
                            ]
                            ]
                    ]
                ]
            ],
            'suites' => [
                'TSF050' => [
                    'paths' => "[ %paths.base%/features/features_maxmara/TSF050-utils ]",
                    'contexts' => [
                        'MaxmaraTSF002Context' => "Italy_Maxmara_UAT"
                    ]
                ]
            ]
        ]
    ];

    public function getconfigYml() {
        $yaml = Yaml::dump($this->config);
        file_put_contents('file.yml', $yaml);
        var_dump($yaml);
    }

    public function getBehatYml() {
        $yaml = Yaml::dump($this->behat);
        file_put_contents('behat.yml', $yaml);
        var_dump($yaml);
    }

    public function printBehatYml($brand, $country) {
        $featureBrandPath = $this->featureBrandPath($brand);
//        $country = $this->getCountry();
        $i = "default:
  extensions:
    Vanare\BehatCucumberJsonFormatter\Extension:
      outputDir: %paths.base%/artifacts
    Behat\MinkExtension\ServiceContainer\MinkExtension:
      base_url: \"\"
      sessions:
        browser_stack:
          browser_stack:
            username: \"qasupport4\"
            access_key: \"EKPbquBzpXZcfqMjyVYu\"
            capabilities: {\"browser\" :\"Chrome\", \"browserVersion\": \"80\", \"os\": \"windows\", \"os_version\": \"10\", \"resolution\": \"1920x1080\", \"acceptSslCerts\": true, \"browserstack-debug\": true, \"project\": \"maxmara_automation\", \"build\": \"MAXMARA_AUTO_TESTS_LSPANO\"}
        local:
          selenium2:
            wd_host: 'http://phantomjs:4444/wd/hub'
            capabilities: { \"browser\": \"phantomjs\", \"version\" : \"xx.xx\"}

  suites:
        TSF050:
          paths: [ %paths.base%/features/features_" . $featureBrandPath[0] . "/TSF050-utils ]
          contexts:
            - " . $featureBrandPath[1] . "TSF002Context:
                - Italy_" . $featureBrandPath[1] . "_UAT";
        file_put_contents('behat.yml', $i);
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

}