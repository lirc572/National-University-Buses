import 'dart:io';

import 'package:http/http.dart';
import 'package:http/testing.dart';

const _baseUrl = 'nnextbus.nus.edu.sg';

MockClient mockApiClient = MockClient((request) async {
  if (request.url.authority != _baseUrl) {
    return Response('', 400);
  }
  if (request.headers['Authorization'] == null) {
    return Response('Unauthorized Access', 401);
  }
  switch (request.url.path) {
    case '/BusStops':
      return Response(
        '''{"BusStopsResult":{"busstops":[{"caption":"AS5","latitude":1.29349994659424,"longitude":103.772102355957,"name":"AS7","LongName":"AS 5","ShortName":"AS 5"},{"caption":"BIZ 2","latitude":1.29333997411937,"longitude":103.775159716606,"name":"BIZ2","LongName":"BIZ 2","ShortName":"BIZ 2"},{"caption":"Botanic Gardens MRT","latitude":1.32270002365112,"longitude":103.815101623535,"name":"BG-MRT","LongName":"Botanic Garden MRT","ShortName":"BG MRT"},{"caption":"BTC - Oei Tiong Ham Building","latitude":1.31974358180187,"longitude":103.817929506302,"name":"BUKITTIMAH-BTC2","LongName":"Oei Tiong Ham Building","ShortName":"OTH Bldg"},{"caption":"Central Library","latitude":1.29639995098114,"longitude":103.772201538086,"name":"CENLIB","LongName":"Central Library","ShortName":"CLB"},{"caption":"College Green","latitude":1.32333302497864,"longitude":103.816307067871,"name":"CGH","LongName":"College Green","ShortName":"College Green"},{"caption":"COM2","latitude":1.29428502886792,"longitude":103.773757815361,"name":"COM2","LongName":"COM 2","ShortName":"COM 2"},{"caption":"EA","latitude":1.30040001869202,"longitude":103.77010345459,"name":"BLK-EA-OPP","LongName":"EA","ShortName":"EA"},{"caption":"Information Technology","latitude":1.29737591743469,"longitude":103.772850036621,"name":"COMCEN","LongName":"Information Technology","ShortName":"IT"},{"caption":"Kent Ridge Bus Terminal","latitude":1.29416704177856,"longitude":103.769721984863,"name":"KR-BT","LongName":"Kent Ridge Bus Terminal","ShortName":"KR Bus Terminal"},{"caption":"Kent Ridge MRT","latitude":1.29483294487,"longitude":103.784393310547,"name":"KR-MRT","LongName":"Kent Ridge MRT","ShortName":"KR MRT"},{"caption":"Kent Vale","latitude":1.30209994316101,"longitude":103.769096374512,"name":"KV","LongName":"Kent Vale","ShortName":"KV"},{"caption":"LT13","latitude":1.29477859091277,"longitude":103.770588576794,"name":"LT13","LongName":"LT 13","ShortName":"LT 13"},{"caption":"LT27","latitude":1.29739999771118,"longitude":103.78099822998,"name":"LT27","LongName":"LT 27","ShortName":"LT 27"},{"caption":"Museum","latitude":1.30110192298889,"longitude":103.77367401123,"name":"MUSEUM","LongName":"Museum","ShortName":"Museum"},{"caption":"Opp HSSML","latitude":1.29277801513672,"longitude":103.775001525879,"name":"HSSML-OPP","LongName":"Opp Hon Sui Sen Memorial Library","ShortName":"Opp HSSML"},{"caption":"Opp Kent Ridge MRT","latitude":1.29487597942352,"longitude":103.784591674805,"name":"KR-MRT-OPP","LongName":"Opp Kent Ridge MRT","ShortName":"Opp KR MRT"},{"caption":"Opp NUSS","latitude":1.29330003261566,"longitude":103.772399902344,"name":"NUSS-OPP","LongName":"Opp NUSS","ShortName":"Opp NUSS"},{"caption":"Opp TCOMS","latitude":1.29379999637604,"longitude":103.777000427246,"name":"PGP12-OPP","LongName":"Opp TCOMS","ShortName":"Opp TCOMS"},{"caption":"Opp UHall","latitude":1.29750001430511,"longitude":103.778198242188,"name":"UHALL-OPP","LongName":"Opp University Hall","ShortName":"Opp UHALL"},{"caption":"Opp University Health Centre","latitude":1.29879999160767,"longitude":103.775497436523,"name":"STAFFCLUB-OPP","LongName":"Opp University Health Centre","ShortName":"Opp UHC"},{"caption":"Opp YIH","latitude":1.2989686469259,"longitude":103.77422451973,"name":"YIH-OPP","LongName":"Opp Yusof Ishak House","ShortName":"Opp YIH"},{"caption":"PGP Hse 15","latitude":1.29305601119995,"longitude":103.777778625488,"name":"PGP14-15","LongName":"PGP House 15","ShortName":"PGP Hse 15"},{"caption":"PGP Hse 7","latitude":1.29320001602173,"longitude":103.777801513672,"name":"PGP7","LongName":"PGP7","ShortName":"PGP7"},{"caption":"Prince George's Park","latitude":1.29180002212524,"longitude":103.780502319336,"name":"PGPT","LongName":"Prince George???s Park","ShortName":"PGP"},{"caption":"Prince George's Park Residence","latitude":1.29099925112011,"longitude":103.780964493752,"name":"PGP","LongName":"Prince George Park Residences","ShortName":"PGPR"},{"caption":"Raffles Hall","latitude":1.30102869529789,"longitude":103.772705554962,"name":"RAFFLES","LongName":"Raffles Hall","ShortName":"Raffles Hall"},{"caption":"S17","latitude":1.29747665891241,"longitude":103.781354546547,"name":"S17","LongName":"S 17","ShortName":"S 17"},{"caption":"TCOMS","latitude":1.29370222151434,"longitude":103.776525914669,"name":"PGP12","LongName":"TCOMS","ShortName":"TCOMS"},{"caption":"The Japanese Primary School","latitude":1.30073094367981,"longitude":103.769973754883,"name":"JP-SCH-16151","LongName":"The Japanese Primary School","ShortName":"The Japanese Sch"},{"caption":"UHall","latitude":1.2972229719162,"longitude":103.778663635254,"name":"UHALL","LongName":"University Hall","ShortName":"UHall"},{"caption":"University Health Centre","latitude":1.2989000082016,"longitude":103.77612015605,"name":"STAFFCLUB","LongName":"University Health Centre","ShortName":"UHC"},{"caption":"University Town","latitude":1.30362176617453,"longitude":103.774675250053,"name":"UTown","LongName":"University Town","ShortName":"UTown"},{"caption":"Ventus (Opp LT13)","latitude":1.29530000686646,"longitude":103.770599365234,"name":"LT13-OPP","LongName":"Ventus","ShortName":"Ventus"},{"caption":"YIH","latitude":1.29869997501373,"longitude":103.774299621582,"name":"YIH","LongName":"Yusof Ishak House","ShortName":"YIH"}]}}''',
        200,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      );
    case '/ShuttleService':
      return Response(
        '''{"ShuttleServiceResult":{"caption":"Prince George's Park","name":"PGPT","TimeStamp":"2021-05-02T14:43:04+08:00","shuttles":[{"arrivalTime":"17","name":"A1","nextArrivalTime":"47","nextPassengers":"-","passengers":"-","arrivalTime_veh_plate":"","nextArrivalTime_veh_plate":""},{"arrivalTime":"3","name":"A2","nextArrivalTime":"19","nextPassengers":"-","passengers":"-","arrivalTime_veh_plate":"PC 4038K","nextArrivalTime_veh_plate":""},{"arrivalTime":"3","name":"D2","nextArrivalTime":"33","nextPassengers":"-","passengers":"-","arrivalTime_veh_plate":"","nextArrivalTime_veh_plate":""},{"arrivalTime":"-","name":"BTC1","nextArrivalTime":"-","nextPassengers":"-","passengers":"-","arrivalTime_veh_plate":"","nextArrivalTime_veh_plate":""},{"arrivalTime":"-","name":"A1E","nextArrivalTime":"-","nextPassengers":"-","passengers":"-","arrivalTime_veh_plate":"","nextArrivalTime_veh_plate":""}]}}''',
        200,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      );
    case '/ServiceDescription':
      return Response(
        '''{"ServiceDescriptionResult":{"ServiceDescription":[{"Route":"A1","RouteDescription":"PGP > KR MRT > CLB > BIZ > PGP"},{"Route":"A2","RouteDescription":"PGP > BIZ > IT > Opp KR MRT > PGP"},{"Route":"D1","RouteDescription":"BIZ > UTown (Loop)"},{"Route":"D2","RouteDescription":"PGP > KR MRT > FoS > UTown (Loop)"},{"Route":"B1","RouteDescription":"KR Ter > IT > UTown > CLB > BIZ"},{"Route":"B2","RouteDescription":"BIZ > IT > UTown > EA > KR Ter"},{"Route":"C","RouteDescription":"KR Ter > UTown > FoS (Loop)"},{"Route":"BTC1","RouteDescription":"KRC > BTC"},{"Route":"BTC2","RouteDescription":"BTC > KRC"},{"Route":"A1E","RouteDescription":"KR MRT > FoS > CLB > BIZ > PGP"},{"Route":"A2E","RouteDescription":"FASS > IT > FoS > Opp KR MRT"}]}}''',
        200,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      );
    case '/PickupPoint':
      return Response(
        '''{"PickupPointResult":{"pickuppoint":[{"pickupname":"BTC - Oei Tiong Ham Building","routeid":199,"busstopcode":"BUKITTIMAH-BTC2","lat":1.31974358180187,"lng":103.817929506302,"LongName":"Oei Tiong Ham Building","ShortName":"OTH Bldg"},{"pickupname":"Botanic Gardens MRT","routeid":199,"busstopcode":"BG-MRT","lat":1.32270002365112,"lng":103.815101623535,"LongName":"Botanic Garden MRT","ShortName":"BG MRT"},{"pickupname":"Museum","routeid":199,"busstopcode":"MUSEUM","lat":1.30103748636864,"lng":103.773807048798,"LongName":"Museum","ShortName":"Museum"},{"pickupname":"EA","routeid":199,"busstopcode":"BLK-EA-OPP","lat":1.30040001869202,"lng":103.77010345459,"LongName":"EA","ShortName":"EA"},{"pickupname":"Kent Ridge Bus Terminal (E)","routeid":199,"busstopcode":"KR-BTE","lat":1.29460000991821,"lng":103.769798278809,"LongName":"","ShortName":""}]}}''',
        200,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      );
    default:
      return Response(
        '',
        404,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      );
  }
});
