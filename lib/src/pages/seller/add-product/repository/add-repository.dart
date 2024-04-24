import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../../infrastructure/commons/repository-Url.dart';

import '../models/seller-add-product-dto.dart';

class SellerAddRepository {
  Future<Either<String, Map<String, dynamic>>> postProduct(
      {required SellerAddProductDto dto}) async {
    try{
      final url = Uri.http(RepositoryUrls.webBaseUrl, RepositoryUrls.postProduct);
      final response = await http.post(
        url,
        body: jsonEncode(
          dto.toJson(),
        ),
        headers: {'Content-Type': 'application/json'},
      );
      if(response.statusCode >= 200 && response.statusCode < 400){
        return Right(jsonDecode(response.body));
      }
      else{
        return Left(response.statusCode.toString());
      }
    }catch(error){
      return Left(error.toString());
    }
  }

  Future<Either<String , List<dynamic>>> getProductByTittle({required String tittle}) async{
    try{
      final url = Uri.http(RepositoryUrls.webBaseUrl , RepositoryUrls.getProduct , {'tittle': tittle});
      final response = await http.get(url);
      if(response.statusCode >= 200 && response.statusCode < 400){
        return Right(jsonDecode(response.body));
      }else{
        return Left(response.statusCode.toString());
      }
    }catch(error){
      return Left(error.toString());
    }
  }
}
