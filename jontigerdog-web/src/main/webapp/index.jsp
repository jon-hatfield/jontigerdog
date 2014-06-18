<!DOCTYPE html>
<html ng-app="DemoApp">
    <head>
        <meta charset="UTF-8">
        <title>angular-carousel demo</title>
        <meta name="viewport" content="width=620, user-scalable=no">
        <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link href='./dist/angular-carousel.css' rel='stylesheet' type='text/css'>
        <link href='./demo/demo.css' rel='stylesheet' type='text/css'>
    </head>
    <body ng-controller="DemoCtrl">
        <div class="top-section">
        	<h1 class="left">Artist</h1>
        	<div class="my-name">
        		<h2><span class="orange">//</span> <span class="red">Jontigerdoghatfield</span></h2>
        	</div>
        </div>
        
        <ul rn-carousel rn-carousel-index="slideIndex2" rn-carousel-control class="my-slider ng-cloak">
            <li ng-repeat="slide in slides2" ng-style="{'background-image': 'url(' + slide.img + '.png' + ')'}"></li> 
            <!-- <li><img src="images/1.png" /></li>
			<li><img src="images/2.png" /></li>
			<li><img src="images/3.png" /></li> -->
        </ul>
		<div class="ng-cloak thumbs">
			<div class="thumb" ng-repeat="slide in slides2"
				ng-click="$parent.slideIndex2=$index"
				ng-style="{'background-image': 'url(' + slide.img + '-thumb.png' + ')'}"
				ng-class="{'is-active': ($parent.slideIndex2==$index)}"></div>
		</div>
        
        <div class="contact-info">
       		<a href="http://www.facebook.com/jontigerdoghatfield" target="_blank">
       			<img src="images/fb-icon.png" />www.facebook.com/jontigerdoghatfield
       		</a>
       		<br />
       		<a href="mailto:theartist@jontigerdoghatfield.com">
				theartist@jontigerdoghatfield.com
			</a>
        </div>
        <div class="influences">
       		<div class="indented-title orange">
       			Influences
       		</div>
       		<br />
       		<a href="http://en.wikipedia.org/wiki/Leonardo_da_Vinci" target="_blank">
       			<img src="images/influences/mona-lisa.png" />
       		</a>
       		<a href="http://en.wikipedia.org/wiki/Pantera" target="_blank">
       			<img src="images/influences/pantera.png" />
       		</a>
       		<a href="http://en.wikipedia.org/wiki/Akira_%28film%29" target="_blank">
       			<img src="images/influences/akira.png" />
       		</a>
       		<br />
       		<a href="http://en.wikipedia.org/wiki/Hayao_Miyazaki" target="_blank">
       			<img src="images/influences/hayao-miyazaki.png" />
       		</a>
       		<a href="http://en.wikipedia.org/wiki/Immolation_%28band%29" target="_blank">
       			<img src="images/influences/immolation.png" />
       		</a>
       		<a href="http://en.wikipedia.org/wiki/My_Neighbor_Totoro" target="_blank">
       			<img src="images/influences/totoro.png" />
       		</a>
       		<br />
       		<a href="http://www.goldie.co.uk" target="_blank">
       			<img src="images/influences/goldie.png" />
       		</a>
       		<a href="http://en.wikipedia.org/wiki/Joan_Mir%C3%B3" target="_blank">
       			<img src="images/influences/miro.png" />
       		</a>
       		<a href="http://en.wikipedia.org/wiki/Voltaire" target="_blank">
       			<img src="images/influences/voltaire.png" />
       		</a>
        </div>
    </body>
    <script src="google-angular-links/angular-min.js"></script>
    <script src="google-angular-links/angular-touch-min.js"></script>
    <script src="./dist/angular-carousel.js"></script>
    <!--<script src="./src/angular-carousel.js"></script>
    <script src="./src/directives/rn-carousel.js"></script>
    <script src="./src/directives/rn-carousel-indicators.js"></script>
    <script src="./src/directives/sliceFilter.js"></script>-->
    <script>
        angular.module('DemoApp', [
            'angular-carousel'
        ])

        .controller('DemoCtrl', function($scope, $timeout) {
            $scope.colors = ["#fc0003", "#f70008", "#f2000d", "#ed0012", "#e80017", "#e3001c", "#de0021", "#d90026", "#d4002b", "#cf0030", "#c90036", "#c4003b", "#bf0040", "#ba0045", "#b5004a", "#b0004f", "#ab0054", "#a60059", "#a1005e", "#9c0063", "#960069", "#91006e", "#8c0073", "#870078", "#82007d", "#7d0082", "#780087", "#73008c", "#6e0091", "#690096", "#63009c", "#5e00a1", "#5900a6", "#5400ab", "#4f00b0", "#4a00b5", "#4500ba", "#4000bf", "#3b00c4", "#3600c9", "#3000cf", "#2b00d4", "#2600d9", "#2100de", "#1c00e3", "#1700e8", "#1200ed", "#0d00f2", "#0800f7", "#0300fc"];

            function addSlide(target, style) {
                var i = target.length;
                target.push({
                    label: 'slide #' + (i + 1),
                    img: 'images/' + (i % 10),
                    color: $scope.colors[ (i*10) % $scope.colors.length],
                    odd: (i % 2 === 0)
                });
            };

            function addSlides(target, style, qty) {
                for (var i=0; i < qty; i++) {
                    addSlide(target, style);
                }
            }

            // 2nd ngRepeat demo
            $scope.slides2 = [];
            $scope.slideIndex = 0;
            addSlides($scope.slides2, 'optional-url-segment', 9);

            $scope.prev = function() {
                $scope.slideIndex--;
            }
            $scope.next = function() {
                $scope.slideIndex++;
            }
            $scope.swipe = true;
            $scope.toggleSwipe = function() {
                $scope.swipe = !$scope.swipe;
            }

            // 4rd demo, object based iterable
            $scope.slideIndex3 = 2;
            $scope.slides3 = {
                '#1': $scope.colors[5],
                '#2': $scope.colors[15],
                '#3': $scope.colors[25],
                '#4': $scope.colors[35],
                '#5': $scope.colors[45]
            }

            // thumbs demo
            $scope.slideIndex2 = 0;

            // ngIf demo
            $scope.showCarousel = false;
            $scope.demo = {
                ifIndex: 2
            }
            $scope.slides5 = [
                $scope.colors[5],
                $scope.colors[15],
                $scope.colors[25],
                $scope.colors[35],
                $scope.colors[45]
            ]

        });

    </script>
</html>