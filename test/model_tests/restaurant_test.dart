import 'package:flutter_test/flutter_test.dart';
import 'package:randomized_restaurant/models/restaurant.dart';
import 'package:randomized_restaurant/models/atmosphere.dart';

import '../fixtures/test_restaurants.dart' as test_restaurants;

void main() {
  List<(int, int)> convertTime(
    List<(int openHour, int openMinute, int closehour, int closeMinute)> times,
  ) => times
      .map((time) => (time.$1 * 60 + time.$2, time.$3 * 60 + time.$4))
      .toList();

  group('Test a restaurant', () {
    test('Restaurant instance should have all correct fields', () {
      final restaurant = Restaurant.fromPlacesApiJson(
        test_restaurants.restaurantOne,
      );

      expect(
        restaurant.id,
        "ChIJpQmgMoQys1IRID1e5YB8eMo",
        reason: 'Restaurant ID did not match',
      );

      expect(restaurant.name, 'Spoon and Stable', reason: 'Name did not match');

      expect(
        restaurant.address,
        '211 N 1st St, Minneapolis, MN 55401, USA',
        reason: 'Address did not match',
      );

      expect(
        restaurant.operatingHours.day(0).primaryPeriods,
        convertTime([(10, 0, 14, 0), (16, 0, 23, 0)]),
        reason: 'Sunday primary hours did not match',
      );

      expect(
        restaurant.operatingHours.day(1).primaryPeriods,
        convertTime([(16, 0, 23, 0)]),
        reason: 'Monday primary hours did not match',
      );

      expect(
        restaurant.operatingHours.day(2).primaryPeriods,
        convertTime([(16, 0, 23, 0)]),
        reason: 'Tuesday primary hours did not match',
      );

      expect(
        restaurant.operatingHours.day(3).primaryPeriods,
        convertTime([(16, 0, 23, 0)]),
        reason: 'Wednesday primary hours did not match',
      );

      expect(
        restaurant.operatingHours.day(4).primaryPeriods,
        convertTime([(16, 0, 23, 0)]),
        reason: 'Thursday primary hours did not match',
      );

      expect(
        restaurant.operatingHours.day(5).primaryPeriods,
        convertTime([(16, 0, 23, 30)]),
        reason: 'Friday primary hours did not match',
      );

      expect(
        restaurant.operatingHours.day(6).primaryPeriods,
        convertTime([(16, 0, 23, 30)]),
        reason: 'Saturday primary hours did not match',
      );

      expect(restaurant.operatingHours.day(0).secondaryPeriods.values, [
        convertTime([(15, 0, 18, 0), (20, 0, 22, 0)]),
      ], reason: 'Sunday secondary hours did not match');

      expect(restaurant.operatingHours.day(1).secondaryPeriods.values, [
        convertTime([(15, 0, 18, 0), (20, 0, 22, 0)]),
      ], reason: 'Monday secondary hours did not match');

      expect(restaurant.operatingHours.day(2).secondaryPeriods.values, [
        convertTime([(15, 0, 22, 0)]),
      ], reason: 'Tuesday secondary hours did not match');

      expect(restaurant.operatingHours.day(3).secondaryPeriods.values, [
        convertTime([(15, 0, 22, 0)]),
      ], reason: 'Wednesday secondary hours did not match');

      expect(restaurant.operatingHours.day(4).secondaryPeriods.values, [
        convertTime([(15, 0, 22, 0)]),
      ], reason: 'Thursday secondary hours did not match');

      expect(restaurant.operatingHours.day(5).secondaryPeriods.values, [
        convertTime([(15, 0, 18, 0)]),
      ], reason: 'Friday secondary hours did not match');

      expect(restaurant.operatingHours.day(6).secondaryPeriods.values, [
        convertTime([(15, 0, 18, 0)]),
      ], reason: 'Saturday secondary hours did not match');

      expect(
        restaurant.operatingHours.day(0).secondaryPeriods.keys.first,
        'HAPPY_HOUR',
        reason: 'Secondary hours type did not match',
      );

      expect(restaurant.location, (
        latitude: 44.985524399999996,
        longitude: -93.2694875,
      ), reason: 'Lat/Long coordinates did not match');

      expect(restaurant.categoryTypes, [
        "american_restaurant",
        "restaurant",
        "food",
        "point_of_interest",
        "establishment",
      ], reason: 'Category types did not match');

      expect(restaurant.rating, 4.7, reason: 'Rating did not match');

      expect(
        restaurant.userRatingCount,
        3108,
        reason: 'User rating count did not match',
      );

      expect(
        restaurant.priceLevel,
        PriceLevel.expensive,
        reason: 'Price level did not match',
      );

      expect(restaurant.priceRange, (
        startPrice: '50',
        endPrice: '100',
      ), reason: 'Price range did not match');

      expect(
        restaurant.summary,
        'Hip choice for a French-inspired menu in a cozy, rustic-chic former horse stable.',
        reason: 'Description did not match',
      );

      expect(
        restaurant.websiteUri,
        'http://www.spoonandstable.com/',
        reason: 'Restaurant URI did not match',
      );

      expect(restaurant.phoneNumber, '(612) 224-9850');

      expect(restaurant.atmosphereFlags, [
        AtmosphereFlag.delivery,
        AtmosphereFlag.dineIn,
        AtmosphereFlag.reservable,
        AtmosphereFlag.goodForGroups,
        AtmosphereFlag.outdoorSeating,
        AtmosphereFlag.servesVegetarianFood,
        AtmosphereFlag.servesBrunch,
        AtmosphereFlag.servesDinner,
        AtmosphereFlag.servesCoffee,
        AtmosphereFlag.servesDessert,
        AtmosphereFlag.servesCocktails,
        AtmosphereFlag.servesWine,
        AtmosphereFlag.servesBeer,
      ], reason: 'Atmosphere flags did not match');

      // expect(restaurant.photoNames, [
      //   'places/ChIJpQmgMoQys1IRID1e5YB8eMo/photos/AWCwydiWniqfptZLO0LBBXOGGjcp2xIqTthyDTxd7F9_6C-a1o9DUFYacjvQcqP9baBQXf7fWlcvRAFzTS26ln0sspGyHO-s1IdofvZzZNM0MpXayALyN5KBO6KdjLXupotAuy4s21qgpPLBURqJZkODKNngbrsdtdO6VZlcyoGahMwcrDTHodLV_IreURJfz9D1LTk0OzWUbXro95YN8HSusXZKmeMW-t8QV3EhTeYyuflYTe-5xIuEfTh1Z9jPN9KcNGLaJdZ0zsUI3BEHh0Dkec3n5oo9MgUA0F_EpXK0k3Zcf_ACwECc-GPWtTYA1v7y_zbD0VdZBVTdLZSWMSySdMxJGSNigJSBD-cKGT3PPwiogX6PhkNwww0AEeub7wWj2BNn4j-ee3HtyMrSmhF1A9Duw9FGBdlNgemS__nLEwSXhg',
      //   'places/ChIJpQmgMoQys1IRID1e5YB8eMo/photos/AWCwydhhtgSCFHS8LG2DA9IrND2cOtnx4YP3JTDqT9CY-j8vXtC36lq51-DOsyZiSW0ZslvEqmKwepkQU2t_SN8tPgA7m4j_f8dofrzaWaezOPA_VFd7aBE_1v9qyz_JKlWQumkNp3L1le_YcYsgTnbM-6ytaThZUMIoe1Vur9C6uO2Y36MPnngAEXJfPKV2enK-M1S3XYBSC-RSDdc13TNuUDEiWvJ_8ER_KAif-25sfs4NcFTcSNDWhkSFBBhC-3tSc34tnxc4o0fVZ9SYnG32fiXBHC0kkgKguBqwG8e6_RLef2iOEL9wmHtsT3FXGWLIVHl4q_tbZqTanL-msyUeCPr-RFtwYAjeBrWDcbtJ_XBjKamhlkYJYLHkXJKznZ4hvsPZLY8RT1by0RyLIl-3j3JKjP_qHvqor7-xqDqnblXmvFfX',
      //   'places/ChIJpQmgMoQys1IRID1e5YB8eMo/photos/AWCwydjZRHwn92JXahnT3Pyu2qKKOia231kuM8vnfVX3zsnAMovcPJh5dWC5xEroGA08IjaZ3pc-T407wfOOy4b9XbevbYR4tKEYAqwYnSxMCRh-BKtCLrC7ENLtnVENqL9BlfeWMIbREubdtCF9GRSqfoCZag7Fup8tZqbxGLZG-pu_aZtDbLNhABepDVuo8kgbMSBm41wR7v4b6U0DzgOpn0pE0W-IpWXty7ciwae-SHsjZkA0gstA5Vsm8cyd4_qco5xjb4_GKifLtt4IEN3Ds_TxV6_knSMVKiHnRkukU7O6hvyKObjzlU0Hwim0b2DwrA-xszvtngXiBAFDvbAFPOrO3IODAK2ffr_xlbx1fhCczy_yMzODZYp-TJgCO_U-vRhqXCp8gjDqhdaD87euQZ1fKvpJUZoSCSY2t-ZnlZgWFEv5zpUy2lvI6sU78Tph',
      //   'places/ChIJpQmgMoQys1IRID1e5YB8eMo/photos/AWCwydh0Ryh02Eo6D6L7qqWCVSvwT59KTJMx9C2VnpSXMhvNLOTHeePvrR9v-So_kMsNWMTzILn5ZkRVpZkxpV8CyhirMv-kO-ugmdm7ji_TX1A_z_BYWZMXWYRqbGXw69Wt0jS1HTBbQdpWE-p7-5t3SQhfh7DXnyE2DOXyULAbuj2C4xwmaatTrzieE0lCc_zRWZQ6RTPbTfdbC9QqNFK6OTVM78P-t3WMWGsI04ZjGwpEmmmfH-8vilSYM99nYYDowWKexrDRwtKruEF1_4WazwH4jGAb4EG-GNp2Z6KUNygjLZ4Gq7ZKkhd150TR2DZlFz2q6-Zlms-WELxsES5PUPRDC7xVCzBDgYWHmq4HV7NfXsSMzrESAy9inj2wKHU7ToQeWR-w5-bDeqr57eABnDpLq5cDot0PXYp58mw_3sRdIZk-gIimhqSAUmOQj2mS',
      //   'places/ChIJpQmgMoQys1IRID1e5YB8eMo/photos/AWCwydi1kMhzx4_W7fjrqVLtPZb6IM2VCVHQP9UczNswfuwpwDBaJc5d9xWThX_4r3h9Vsu7tySWv6vhBYrafnvOJ18acfKCm9K0wVQ4YBa-hyptt0o3bvMZeqzn9y7ZoLIn20epVARafm5EHwQwj0-MtsdKAdaVZEPLzhOFAoXucwor9YbkqMVpdv_8V_2PRdZUdWZKhDTBRJfmiAVhklZnKqm6bvjNuaviCr_d2hseJilJN2amvGlyRceIfuBTGYFILH8IkysPvig3dUfG2jvI0ZIqYL92TSaoXoo4ePRN_i16IUfmkaNutY4xEQq8EFcZOeVnJhti8uwxKbSoin1UN8Nn0AHpBGO_zO0IlD0mCxBcgS1ZeiluQM-Efy0h6nLl1QUSCpCBCAT7zUx-gUzKPgGK-XqaDhU1O8P_TrhfX-ySf-cfeTFU2EKdEVIYz02K',
      //   'places/ChIJpQmgMoQys1IRID1e5YB8eMo/photos/AWCwydhwm8jzn4wnI9KJFv0TRHhprJ67xkbZLeoki0Ukdq-tZdZ_11TjMhtCUq8KSce9oYOL_qSV9EpfsBwDWAYMcQ2mX_w9RluL8ABosmBtqRObMducztHg9Di5NAUDLscCMnamMmRKgK0zTRd2WMFKJwLsPq9y-9_MJ-4pxcoDyZJXNY6zurOZP__p8JYQcXJ7s0KQSuD1D4A4tPYTm3pmRduLODuWzw7wm4P7TRZX6uqDDrfhpFeFTDh-sOFNs2WOA7Ih1Wng3RR049kCdPNAOuwRPV0_AaZvsFcxmnWu5y1X_Fx8AKKVOMFKzyfGpfiN5u7BStoFCS_qGolrDif3Kg-UXhuwV5mL3VKkF7Z375meidg-SWT2Tjmj9QrsPuoiUPxCjKT1dFFWTZSaMTZv831hOLIbsuMKP3ExEqng-YLCKLbf1928NVX4hPf0dKxq',
      //   'places/ChIJpQmgMoQys1IRID1e5YB8eMo/photos/AWCwydh0oPNGrPZ2ENfS8E6lc92rnCzuljOXlDRwHA1EKRW4vFGxG9ooIbMIqrb-9QdvdKQDyJHFKnqjCZogn4CbNunqfVJdcA6zo3zhjGMc6DRxqzqjeYXifPSpdh_UTXLDifaeZxVsG15y4PrnyDfFJLEVGcw9I18zC9N_y9Z0cSulplOV0EJl-Nq4-YuCoJaufVXrjwuWlJpPsIjl9AtQmqE4qoWnXgkUvO4H2c0BRakjxmQFJomlVmvyUNZghuHUdk7q15ERkYQlzcsZt2uo2u35kIeWzSytEoG1XlKNoX_qTjem0jvDFXdqyLjhmcVJ9Hhbn5mTV5DtxBvamUQeGRq9G5ZXVX3npk27Zs1iGopxZLUGMnpnAV6nY1g-HWBUYXn00-TKa2heETLpk-HGIxkH6K5k_kCYAONBd8T30LxtpuA_sAKhlTee0vA0fWYs',
      //   'places/ChIJpQmgMoQys1IRID1e5YB8eMo/photos/AWCwydhVrRwEpksnmBgloDa-xYPrXQAHAQL27Aco9T_hygm-eYciYIc4ESdEDFQSP8flyZW0CvUc67pAN0TbtkUYd_2gxj5RidliMkMU28203SNEnIICiZ5XWAM0zs6rAobLOpnHT53HRyODYmLk_CDBf-EkuLpyxWU8Zrl4DemzrcQeKF63p3yHoupd-EJfuWxzFt0d6npfNQS35L5wLnAWPKpOWx3UYmJnDT-cGseM2sgmmLORSUKRrQwnje7oEadfvJhzHsptLBfBkPiD3TR24Da5nyVzKbE0_S3bbZJ_1mkr8FVFFDupqaJVTKdUKPf9baQMKrrASfZIaef-qa7TL3yPK0FcrXr4zbUers3crVsiw80veWXG1G4mRjKOZobwN7R3lV8UXHGuLTBEJnpNbDRKaalyuMi19ButceVqfS0MKo5XVIkjkcYmHOnpVxOB',
      //   'places/ChIJpQmgMoQys1IRID1e5YB8eMo/photos/AWCwydgqLWpk6W9vRp8ih6U9IE1bcfb1TVs-UccB1UFz9_dSADwt-QDLw97-JT9IdMdlF_08Kf6eR0y74N2yHQJ2IkuIbKV4DzH10XWTqglxPNy-XXC17WAF-dwhzLgQCesC3TZtEfdGpIaROsMnMRDtUkklyi0sae2fFyokFkjMTatbS9ahF04BY3cGRRCsoL5e6B08qSQ-tteZ2rn_lNcxRZZBOdPcMgkg0Bmm-J3Ir8nfsIs2yboA4TeaLjpxPt_i34dIshY9SxkIWKkQxs7X8jo50s9p8hZQIwxd4xtU1XOZWogSF69HH4z2C-ROTi1J-JFRqrh0X80wJw_85ipwjw5SNQeCWSnp4UN--SGgri4qAWIS20uI4k4jXez8VAZFWO8EHImugzLBAa4h1_fCvQ5MTD_nOJNPPEs0dVp4TIyFqHOE3HCL1CYpwkHME7k-',
      //   'places/ChIJpQmgMoQys1IRID1e5YB8eMo/photos/AWCwydip-H3SXOWbVFNZJvZL3OKQsnVXP_dQcWvnPAsYILYKHd30EkX4sa1PRj3FZZ4VKmw3lu0EqsBXj-ESCUD1s72Lc2ytA0cXkYg58dMIJ1-5grM5eN3E5N0TDbHg6C8xUll41Rm17faNM4BArXPZIcljtgS1C5art27Q5D9TRoheyXR3uKXoRrz2flvj474IBGl12PBXPZPTu4qs-URjDrHkH5zj_W8nZ1rtCY1avx-5YzthbwWBlSvMlHzFKzryRGYXlISBxI0EWovJ39O9nhw0h6EHq5UecJWvSGYr8tI9BHYtG7Nz8S5c40H--pxmp5XpYwQ55mKYiZrWOcFKkm_tLkegP06QpwaIoInYDu490ws08eqAlU-QzU9g2sHV0w2wPmbqpHJTuCBwV2QseaWak2WEZk2m2_yAPXLwqWto-jkwt4D8tJlDnCnCbjUS',
      // ], reason: 'List of photo names did not match');

      // expect(
      //   restaurant.cachedAt,
      //   isNot(null),
      //   reason: 'Cached time was not set correctly',
      // );
    });
  });

  group('Restaurant default values', () {
    final Restaurant restaurant = Restaurant.fromPlacesApiJson({
      'id': 'restaurant-id',
    });
    test('Restaurant uses proper default values for missing JSON fields', () {
      expect(restaurant.name, '');
      expect(restaurant.address, '');
      expect(restaurant.location, (latitude: 0.0, longitude: 0.0));
      expect(restaurant.categoryTypes, <String>[]);
      expect(restaurant.rating, 0.0);
      expect(restaurant.userRatingCount, 0);
      expect(restaurant.priceLevel, PriceLevel.unspecified);
      expect(restaurant.websiteUri, '');
      expect(restaurant.phoneNumber, '');
      expect(restaurant.atmosphereFlags, <AtmosphereFlag>[]);
      expect(restaurant.photos, <String>[]);
      expect(restaurant.summary, '');
    });
  });

  group('Restaurant equality', () {
    final restaurantOne = Restaurant.fromPlacesApiJson(
      test_restaurants.restaurantOne,
    );
    final restaurantTwo = Restaurant.fromPlacesApiJson(
      test_restaurants.restaurantTwo,
    );
    test('A restaurant is equal with itself', () {
      expect(
        restaurantOne,
        restaurantOne,
        reason: 'A restaurant does not equal itself',
      );
    });

    test('Two different restaurants are not equal to each other', () {
      expect(
        restaurantOne,
        isNot(restaurantTwo),
        reason: 'A restaurant is equal to a different restaurant',
      );
    });
  });

  group('Restaurant price level parsing', () {
    Restaurant restaurantWithPriceLevel(String value) {
      return Restaurant.fromPlacesApiJson({
        'id': 'price-test',
        'priceLevel': value,
      });
    }

    test('Parses each known price level string', () {
      expect(
        restaurantWithPriceLevel('PRICE_LEVEL_FREE').priceLevel,
        PriceLevel.free,
        reason: 'Restaurant has incorrect price level',
      );

      expect(
        restaurantWithPriceLevel('PRICE_LEVEL_INEXPENSIVE').priceLevel,
        PriceLevel.inexpensive,
        reason: 'Restaurant has incorrect price level',
      );

      expect(
        restaurantWithPriceLevel('PRICE_LEVEL_MODERATE').priceLevel,
        PriceLevel.moderate,
        reason: 'Restaurant has incorrect price level',
      );

      expect(
        restaurantWithPriceLevel('PRICE_LEVEL_EXPENSIVE').priceLevel,
        PriceLevel.expensive,
        reason: 'Restaurant has incorrect price level',
      );

      expect(
        restaurantWithPriceLevel('PRICE_LEVEL_VERY_EXPENSIVE').priceLevel,
        PriceLevel.veryExpensive,
        reason: 'Restaurant has incorrect price level',
      );
    });

    test('Falls back to unspecified for missing or unknown price values', () {
      expect(
        restaurantWithPriceLevel('UNKNOWN_VALUE').priceLevel,
        PriceLevel.unspecified,
        reason: 'Unknown price value incorrectly maps to existing price level',
      );

      expect(
        Restaurant.fromPlacesApiJson({'id': 'price-test'}).priceLevel,
        PriceLevel.unspecified,
      );
    });
  });

  group('Restaurant summary', () {
    final restaurantEditorial = Restaurant.fromPlacesApiJson(
      test_restaurants.restaurantOne,
    );
    final restaurantGenerative = Restaurant.fromPlacesApiJson(
      test_restaurants.restaurantThree,
    );
    final restaurantBothSummaries = Restaurant.fromPlacesApiJson(
      test_restaurants.restaurantFour,
    );
    final restaurantNoSummary = Restaurant.fromPlacesApiJson(
      test_restaurants.restaurantTwo,
    );
    test(
      'Prefers editorial summary with and without generative summary present',
      () {
        expect(
          restaurantBothSummaries.summary,
          'An awesome restaurant.',
          reason: 'Summary did not default to the editorial summary when both were present',
        );

        expect(
          restaurantEditorial.summary,
          'Hip choice for a French-inspired menu in a cozy, rustic-chic former horse stable.',
          reason: 'Editorial summary not used when alone',
        );
      },
    );

    test(
      'Restaurant uses generative summary if editorial summary is not present',
      () {
        expect(
          restaurantGenerative.summary,
          'A pretty cool restaurant that serves food!',
          reason: 'Restaurant did not use generative summary',
        );
      },
    );

    test('Restaurant with no summary defaults to empty string', () {
      expect(
        restaurantNoSummary.summary,
        '',
        reason: 'No summary did not default to empty string',
      );
    });
  });
}
