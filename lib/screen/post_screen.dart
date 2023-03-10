import 'package:anther/cubit/layout_cubit.dart';
import 'package:anther/cubit/layout_state.dart';
import 'package:anther/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostScreen extends StatelessWidget {
  PostScreen({Key? key}) : super(key: key);
  final titleController =TextEditingController();
  final priceController =TextEditingController();
  final descController =TextEditingController();
  final imageController =TextEditingController();
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(
      listener: (context,state)
      {
        if(state is RegisterSuccessState){
          print(titleController);
          print(priceController);
          print(descController);
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        }
        else if(state is RegisterFailureState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
          Container(
            alignment: Alignment.center,
            height: 100,
            width: double.infinity,
            child: Text('error'),)));
        }
      },

      builder: (context,state)

      {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'title',
                      border: OutlineInputBorder(),
                    ),
                    validator: (input){
                      if(titleController.text.isNotEmpty)
                      {
                        return null;
                      }
                      else{
                        return 'title must not be empty!';
                      }
                    },
                  ),
                  SizedBox(height: 12,),
                  TextFormField(
                    controller: descController,
                    decoration: InputDecoration(
                      hintText: 'desccription',
                      border: OutlineInputBorder(),
                    ),
                    validator: (input){
                      if(descController.text.isNotEmpty)
                      {
                        return null;
                      }
                      else{
                        return 'desc must not be empty!';
                      }
                    },
                  ),
                  SizedBox(height: 12,),
                  TextFormField(
                    controller: priceController,
                    decoration: InputDecoration(
                      hintText: 'price',
                      border: OutlineInputBorder(),
                    ),
                    validator: (input){
                      if(priceController.text.isNotEmpty)
                      {
                        return null;
                      }
                      else{
                        return 'price must not be empty!';
                      }
                    },
                  ),
                  SizedBox(height: 12,),

                  MaterialButton(
                    onPressed: ()
                    {
                      if(formKey.currentState!.validate()==true){
                        BlocProvider.of<AuthCubit>(context).register(
                            title: titleController.text,
                            price: priceController.text,
                            desc: descController.text,
                            );
                      }
                    }
                    ,
                    color: Colors.green,
                    minWidth: double.infinity,
                    child: Text('Post'),),
                ],
              ),
            ),
          ),
        );
      } ,
    );
  }
}
