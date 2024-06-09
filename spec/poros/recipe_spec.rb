require "rails_helper"

RSpec.describe Recipe do
  before(:each) do
    @recipe_attr = {
      "recipe": {
        "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_8cd4e6b1725143938313649aa5203616",
        "label": "Steamed Thailand Turkey Burger",
        "image": "https://edamam-product-images.s3.amazonaws.com/web-img/d7a/d7aadde1ff6875e8d46f46c692691d73.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIGLd0cbATG7vOBWkMpcnB4vTvQOi4H%2BEjuwEhDj3c8pcAiEA8%2Bs82x1qKEkqMQpm2qeua%2F4F1ARgwt%2BzH7LTeyTermgquQUILxAAGgwxODcwMTcxNTA5ODYiDDSslw0XjUUzZ0iiqiqWBTN5M2hoJGAR6a7RG7upYGkc8Bt%2B%2FtFebbRioiDQpzAbxdoSRW6z4hIpJnfCdQOcqw%2BfKYRwfpBo8w3aL3dxx4JXbJkzbJhdLSHHDHxC4R71xUWRwwmzqRQcUjGXKr1alc2jdxlrILMRnUfGFVJECNZ0tXWhrcopcAv%2F9OSYaM7GEfg6Y2hszpOJBa6Lt8Z%2FOx8pCxbolkUBw70yu6pXoplI4RBLD6%2F33Uy99yO1jCEi10D6QHktRSxwre6Q0z%2Fqq7%2B1Wmh1BQ%2FgqCHFzWc9UN8clZLK1LiZm4banhzm0dA5Knkc5Q2OY7m2V3HdoNPSjSQEbyy7IPDuLQHL2briKsuNaHFthBYuLp02dLQiAS5aV68YRAuwO8YssfStdAt9lGkzC9gOKkLAkyqCDd%2F5OPaRfKAF%2FxcaGsrBfXRY%2FOp5pC78FA%2By6jelRXttcq4Rr5o6Mppq4nnIAoM4wiXcLve0kFMBCDApjmefcH8gNMyFhY%2BF%2BqFviYHykHDqxv%2Bt1lXhNhJaaXUj6XiazWCRlvwby5kSfUfGKO3L3DMkQ2CKhQ%2B9BxOJfdQ7bb6sCDH60MRM5KxHhzxaMLV8PZy6uh%2FTvaz3Zbi2y2s1TVr76qtqlvQkQ%2Bg7o8Z7g1g4iXNl1zYC2rXttvKNgpzRO8DRYLHNJTCZhy%2F89GOM9zFPlrRrHRXeJPqxdlT%2F6kVnGJwkLX989TJ%2B4eErHMHOUhtmZ%2BGRENE5wo%2B2E9i%2BfUavChtFGQk0MYPZXnsekaBoGL3I1joCvIrBQ1o2Hg5XGc7sT%2FsDa46WXYAtxcH2Ne6ZoIIXJuI5psNhPZ3OlK8BZIcv4%2B6%2BjZnaCFWLv5BYlmiIbIHdDx%2BX1C32xc7w2g0OoKwptexc%2BnvnMJzhlrMGOrEBHiWl%2FyYXU2KpJUc5SSXEgTBs%2BQHau7gVl7PDVxKafA1gqN%2BznbkYqnU6COpKSJVHDjasRQLbN0QkQkLeTKaE4lslANcMQFnwxe4RMWUZVdbN49h59JaXVJnzCSaAVijrrb05c9AsTiXOIE0Ha4e%2F%2FfGrKXAGi3Tze7TzfB1hU39VUdxBDBkdep10VmSuFspLKbInEf5%2FdgZ%2F3Tf0RXwNAZEUkv8PBJTqLQgFCYmKOkT7&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240609T153100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFM7S6HFMN%2F20240609%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=8b8b1fb79fc6a62d2f309528ddf4d333b1941822dc0acb877a89caa7e701a2f2",
        "images": {
          "THUMBNAIL": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/d7a/d7aadde1ff6875e8d46f46c692691d73-s.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIGLd0cbATG7vOBWkMpcnB4vTvQOi4H%2BEjuwEhDj3c8pcAiEA8%2Bs82x1qKEkqMQpm2qeua%2F4F1ARgwt%2BzH7LTeyTermgquQUILxAAGgwxODcwMTcxNTA5ODYiDDSslw0XjUUzZ0iiqiqWBTN5M2hoJGAR6a7RG7upYGkc8Bt%2B%2FtFebbRioiDQpzAbxdoSRW6z4hIpJnfCdQOcqw%2BfKYRwfpBo8w3aL3dxx4JXbJkzbJhdLSHHDHxC4R71xUWRwwmzqRQcUjGXKr1alc2jdxlrILMRnUfGFVJECNZ0tXWhrcopcAv%2F9OSYaM7GEfg6Y2hszpOJBa6Lt8Z%2FOx8pCxbolkUBw70yu6pXoplI4RBLD6%2F33Uy99yO1jCEi10D6QHktRSxwre6Q0z%2Fqq7%2B1Wmh1BQ%2FgqCHFzWc9UN8clZLK1LiZm4banhzm0dA5Knkc5Q2OY7m2V3HdoNPSjSQEbyy7IPDuLQHL2briKsuNaHFthBYuLp02dLQiAS5aV68YRAuwO8YssfStdAt9lGkzC9gOKkLAkyqCDd%2F5OPaRfKAF%2FxcaGsrBfXRY%2FOp5pC78FA%2By6jelRXttcq4Rr5o6Mppq4nnIAoM4wiXcLve0kFMBCDApjmefcH8gNMyFhY%2BF%2BqFviYHykHDqxv%2Bt1lXhNhJaaXUj6XiazWCRlvwby5kSfUfGKO3L3DMkQ2CKhQ%2B9BxOJfdQ7bb6sCDH60MRM5KxHhzxaMLV8PZy6uh%2FTvaz3Zbi2y2s1TVr76qtqlvQkQ%2Bg7o8Z7g1g4iXNl1zYC2rXttvKNgpzRO8DRYLHNJTCZhy%2F89GOM9zFPlrRrHRXeJPqxdlT%2F6kVnGJwkLX989TJ%2B4eErHMHOUhtmZ%2BGRENE5wo%2B2E9i%2BfUavChtFGQk0MYPZXnsekaBoGL3I1joCvIrBQ1o2Hg5XGc7sT%2FsDa46WXYAtxcH2Ne6ZoIIXJuI5psNhPZ3OlK8BZIcv4%2B6%2BjZnaCFWLv5BYlmiIbIHdDx%2BX1C32xc7w2g0OoKwptexc%2BnvnMJzhlrMGOrEBHiWl%2FyYXU2KpJUc5SSXEgTBs%2BQHau7gVl7PDVxKafA1gqN%2BznbkYqnU6COpKSJVHDjasRQLbN0QkQkLeTKaE4lslANcMQFnwxe4RMWUZVdbN49h59JaXVJnzCSaAVijrrb05c9AsTiXOIE0Ha4e%2F%2FfGrKXAGi3Tze7TzfB1hU39VUdxBDBkdep10VmSuFspLKbInEf5%2FdgZ%2F3Tf0RXwNAZEUkv8PBJTqLQgFCYmKOkT7&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240609T153100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFM7S6HFMN%2F20240609%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=db7f20c57dda5b38a82ec3e79ebcfd74278e23beb397f0f13f3f2137b0842d92",
            "width": 100,
            "height": 100
          },
          "SMALL": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/d7a/d7aadde1ff6875e8d46f46c692691d73-m.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIGLd0cbATG7vOBWkMpcnB4vTvQOi4H%2BEjuwEhDj3c8pcAiEA8%2Bs82x1qKEkqMQpm2qeua%2F4F1ARgwt%2BzH7LTeyTermgquQUILxAAGgwxODcwMTcxNTA5ODYiDDSslw0XjUUzZ0iiqiqWBTN5M2hoJGAR6a7RG7upYGkc8Bt%2B%2FtFebbRioiDQpzAbxdoSRW6z4hIpJnfCdQOcqw%2BfKYRwfpBo8w3aL3dxx4JXbJkzbJhdLSHHDHxC4R71xUWRwwmzqRQcUjGXKr1alc2jdxlrILMRnUfGFVJECNZ0tXWhrcopcAv%2F9OSYaM7GEfg6Y2hszpOJBa6Lt8Z%2FOx8pCxbolkUBw70yu6pXoplI4RBLD6%2F33Uy99yO1jCEi10D6QHktRSxwre6Q0z%2Fqq7%2B1Wmh1BQ%2FgqCHFzWc9UN8clZLK1LiZm4banhzm0dA5Knkc5Q2OY7m2V3HdoNPSjSQEbyy7IPDuLQHL2briKsuNaHFthBYuLp02dLQiAS5aV68YRAuwO8YssfStdAt9lGkzC9gOKkLAkyqCDd%2F5OPaRfKAF%2FxcaGsrBfXRY%2FOp5pC78FA%2By6jelRXttcq4Rr5o6Mppq4nnIAoM4wiXcLve0kFMBCDApjmefcH8gNMyFhY%2BF%2BqFviYHykHDqxv%2Bt1lXhNhJaaXUj6XiazWCRlvwby5kSfUfGKO3L3DMkQ2CKhQ%2B9BxOJfdQ7bb6sCDH60MRM5KxHhzxaMLV8PZy6uh%2FTvaz3Zbi2y2s1TVr76qtqlvQkQ%2Bg7o8Z7g1g4iXNl1zYC2rXttvKNgpzRO8DRYLHNJTCZhy%2F89GOM9zFPlrRrHRXeJPqxdlT%2F6kVnGJwkLX989TJ%2B4eErHMHOUhtmZ%2BGRENE5wo%2B2E9i%2BfUavChtFGQk0MYPZXnsekaBoGL3I1joCvIrBQ1o2Hg5XGc7sT%2FsDa46WXYAtxcH2Ne6ZoIIXJuI5psNhPZ3OlK8BZIcv4%2B6%2BjZnaCFWLv5BYlmiIbIHdDx%2BX1C32xc7w2g0OoKwptexc%2BnvnMJzhlrMGOrEBHiWl%2FyYXU2KpJUc5SSXEgTBs%2BQHau7gVl7PDVxKafA1gqN%2BznbkYqnU6COpKSJVHDjasRQLbN0QkQkLeTKaE4lslANcMQFnwxe4RMWUZVdbN49h59JaXVJnzCSaAVijrrb05c9AsTiXOIE0Ha4e%2F%2FfGrKXAGi3Tze7TzfB1hU39VUdxBDBkdep10VmSuFspLKbInEf5%2FdgZ%2F3Tf0RXwNAZEUkv8PBJTqLQgFCYmKOkT7&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240609T153100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFM7S6HFMN%2F20240609%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d6b57782837d773110e7211c8c5171314f06e455e4b919c0b976921da1a1b5c1",
            "width": 200,
            "height": 200
          },
          "REGULAR": {
            "url": "https://edamam-product-images.s3.amazonaws.com/web-img/d7a/d7aadde1ff6875e8d46f46c692691d73.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIGLd0cbATG7vOBWkMpcnB4vTvQOi4H%2BEjuwEhDj3c8pcAiEA8%2Bs82x1qKEkqMQpm2qeua%2F4F1ARgwt%2BzH7LTeyTermgquQUILxAAGgwxODcwMTcxNTA5ODYiDDSslw0XjUUzZ0iiqiqWBTN5M2hoJGAR6a7RG7upYGkc8Bt%2B%2FtFebbRioiDQpzAbxdoSRW6z4hIpJnfCdQOcqw%2BfKYRwfpBo8w3aL3dxx4JXbJkzbJhdLSHHDHxC4R71xUWRwwmzqRQcUjGXKr1alc2jdxlrILMRnUfGFVJECNZ0tXWhrcopcAv%2F9OSYaM7GEfg6Y2hszpOJBa6Lt8Z%2FOx8pCxbolkUBw70yu6pXoplI4RBLD6%2F33Uy99yO1jCEi10D6QHktRSxwre6Q0z%2Fqq7%2B1Wmh1BQ%2FgqCHFzWc9UN8clZLK1LiZm4banhzm0dA5Knkc5Q2OY7m2V3HdoNPSjSQEbyy7IPDuLQHL2briKsuNaHFthBYuLp02dLQiAS5aV68YRAuwO8YssfStdAt9lGkzC9gOKkLAkyqCDd%2F5OPaRfKAF%2FxcaGsrBfXRY%2FOp5pC78FA%2By6jelRXttcq4Rr5o6Mppq4nnIAoM4wiXcLve0kFMBCDApjmefcH8gNMyFhY%2BF%2BqFviYHykHDqxv%2Bt1lXhNhJaaXUj6XiazWCRlvwby5kSfUfGKO3L3DMkQ2CKhQ%2B9BxOJfdQ7bb6sCDH60MRM5KxHhzxaMLV8PZy6uh%2FTvaz3Zbi2y2s1TVr76qtqlvQkQ%2Bg7o8Z7g1g4iXNl1zYC2rXttvKNgpzRO8DRYLHNJTCZhy%2F89GOM9zFPlrRrHRXeJPqxdlT%2F6kVnGJwkLX989TJ%2B4eErHMHOUhtmZ%2BGRENE5wo%2B2E9i%2BfUavChtFGQk0MYPZXnsekaBoGL3I1joCvIrBQ1o2Hg5XGc7sT%2FsDa46WXYAtxcH2Ne6ZoIIXJuI5psNhPZ3OlK8BZIcv4%2B6%2BjZnaCFWLv5BYlmiIbIHdDx%2BX1C32xc7w2g0OoKwptexc%2BnvnMJzhlrMGOrEBHiWl%2FyYXU2KpJUc5SSXEgTBs%2BQHau7gVl7PDVxKafA1gqN%2BznbkYqnU6COpKSJVHDjasRQLbN0QkQkLeTKaE4lslANcMQFnwxe4RMWUZVdbN49h59JaXVJnzCSaAVijrrb05c9AsTiXOIE0Ha4e%2F%2FfGrKXAGi3Tze7TzfB1hU39VUdxBDBkdep10VmSuFspLKbInEf5%2FdgZ%2F3Tf0RXwNAZEUkv8PBJTqLQgFCYmKOkT7&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240609T153100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFM7S6HFMN%2F20240609%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=8b8b1fb79fc6a62d2f309528ddf4d333b1941822dc0acb877a89caa7e701a2f2",
            "width": 300,
            "height": 300
          }
        },
        "source": "Food52",
        "url": "https://food52.com/recipes/21104-steamed-thailand-turkey-burger",
        "shareAs": "http://www.edamam.com/recipe/steamed-thailand-turkey-burger-8cd4e6b1725143938313649aa5203616/thailand",
        "yield": 6,
        "dietLabels": [
          "Low-Carb",
          "Low-Sodium"
        ],
        "healthLabels": [
          "Sugar-Conscious",
          "Keto-Friendly",
          "Paleo",
          "Mediterranean",
          "Dairy-Free",
          "Gluten-Free",
          "Wheat-Free",
          "Egg-Free",
          "Peanut-Free",
          "Tree-Nut-Free",
          "Soy-Free",
          "Fish-Free",
          "Shellfish-Free",
          "Pork-Free",
          "Red-Meat-Free",
          "Crustacean-Free",
          "Celery-Free",
          "Mustard-Free",
          "Sesame-Free",
          "Lupine-Free",
          "Mollusk-Free",
          "Alcohol-Free",
          "No oil added",
          "Sulfite-Free",
          "Kosher"
        ],
        "cautions": [
          "Sulfites"
        ],
        "ingredientLines": [
          "1 pound Lean ground turkey",
          "1/2 Medium Onion Chopped",
          "1/2 Medium Red bell Pepper Chopped",
          "1/4 cup Mushrooms Chopped (your choice I like baby bells or shiitake)",
          "1 tablespoon Red Thai Curry",
          "1/2 teaspoon Paprika",
          "1/2 teaspoon Chili Powder",
          "1/2 teaspoon Black Pepper",
          "1/4 teaspoon Ginger",
          "1/2 teaspoon Red Pepper Flakes: optional",
          "1/2 teaspoon Cayenne Pepper: optional",
          "1/3 cup Water"
        ],
        "ingredients": [
          {
            "text": "1 pound Lean ground turkey",
            "quantity": 1,
            "measure": "pound",
            "food": "ground turkey",
            "weight": 453.59237,
            "foodCategory": "Poultry",
            "foodId": "food_av7gav4bs6txmfb85t0ruapws8if",
            "image": "https://www.edamam.com/food-img/c1a/c1a1663042ef7f4d6d50f1f6418aaac6.jpg"
          },
          {
            "text": "1/2 Medium Onion Chopped",
            "quantity": 0.5,
            "measure": "<unit>",
            "food": "Onion",
            "weight": 55,
            "foodCategory": "vegetables",
            "foodId": "food_bmrvi4ob4binw9a5m7l07amlfcoy",
            "image": "https://www.edamam.com/food-img/205/205e6bf2399b85d34741892ef91cc603.jpg"
          },
          {
            "text": "1/2 Medium Red bell Pepper Chopped",
            "quantity": 0.5,
            "measure": "<unit>",
            "food": "Red bell Pepper",
            "weight": 59.5,
            "foodCategory": "vegetables",
            "foodId": "food_a8g63g7ak6bnmvbu7agxibp4a0dy",
            "image": "https://www.edamam.com/food-img/4dc/4dc48b1a506d334b4ab6671b9d56a18f.jpeg"
          },
          {
            "text": "1/4 cup Mushrooms Chopped (your choice I like baby bells or shiitake)",
            "quantity": 0.25,
            "measure": "cup",
            "food": "Mushrooms",
            "weight": 17.5,
            "foodCategory": "vegetables",
            "foodId": "food_bvlose6arfl26ra396sjrb7hetqh",
            "image": "https://www.edamam.com/food-img/d63/d639cf4a2afc7407c1d1ce286028136b.jpg"
          },
          {
            "text": "1 tablespoon Red Thai Curry",
            "quantity": 1,
            "measure": "tablespoon",
            "food": "Curry",
            "weight": 6.3,
            "foodCategory": "Condiments and sauces",
            "foodId": "food_ao4koeoajh7yjxaq2knzrbv55y8o",
            "image": "https://www.edamam.com/food-img/9ce/9ce02a2887385fd2adaec8dd8adcf9c5.jpg"
          },
          {
            "text": "1/2 teaspoon Paprika",
            "quantity": 0.5,
            "measure": "teaspoon",
            "food": "Paprika",
            "weight": 1.15,
            "foodCategory": "Condiments and sauces",
            "foodId": "food_a9dpcnjb883g67b3lq82ca0421ql",
            "image": "https://www.edamam.com/food-img/474/474d63763b9d8b9da98c5f43a114648c.jpg"
          },
          {
            "text": "1/2 teaspoon Chili Powder",
            "quantity": 0.5,
            "measure": "teaspoon",
            "food": "Chili Powder",
            "weight": 1.35,
            "foodCategory": "Condiments and sauces",
            "foodId": "food_aii2sclb4r123rbfr2ybjasrl3nc",
            "image": "https://www.edamam.com/food-img/e6f/e6f19043caefc23b5feda5520076617e.jpg"
          },
          {
            "text": "1/2 teaspoon Black Pepper",
            "quantity": 0.5,
            "measure": "teaspoon",
            "food": "Black Pepper",
            "weight": 1.45,
            "foodCategory": "Condiments and sauces",
            "foodId": "food_b6ywzluaaxv02wad7s1r9ag4py89",
            "image": "https://www.edamam.com/food-img/c6e/c6e5c3bd8d3bc15175d9766971a4d1b2.jpg"
          },
          {
            "text": "1/4 teaspoon Ginger",
            "quantity": 0.25,
            "measure": "teaspoon",
            "food": "Ginger",
            "weight": 0.5,
            "foodCategory": "vegetables",
            "foodId": "food_bi2ki2xb5zmmvbaiwf7ztbgktzp6",
            "image": "https://www.edamam.com/food-img/b9c/b9c06ef451ef29513880af0a53ebbaa6.jpg"
          },
          {
            "text": "1/2 teaspoon Red Pepper Flakes: optional",
            "quantity": 0.5,
            "measure": "teaspoon",
            "food": "Red Pepper Flakes",
            "weight": 0.38541666668621544,
            "foodCategory": "vegetables",
            "foodId": "food_bispmxiaijcuxcagex14mbhk2o48",
            "image": "https://www.edamam.com/food-img/6cb/6cb8e4510251a322178f6e191b3a7b1b.jpeg"
          },
          {
            "text": "1/2 teaspoon Cayenne Pepper: optional",
            "quantity": 0.5,
            "measure": "teaspoon",
            "food": "Cayenne Pepper",
            "weight": 0.9,
            "foodCategory": "Condiments and sauces",
            "foodId": "food_a8iooz3aris8gba605l07brngnrx",
            "image": "https://www.edamam.com/food-img/374/3742b9434a0fb66a45e0dd6d227ba669.jpg"
          },
          {
            "text": "1/3 cup Water",
            "quantity": 0.3333333333333333,
            "measure": "cup",
            "food": "Water",
            "weight": 78.86274549999999,
            "foodCategory": "water",
            "foodId": "food_a99vzubbk1ayrsad318rvbzr3dh0",
            "image": "https://www.edamam.com/food-img/5dd/5dd9d1361847b2ca53c4b19a8f92627e.jpg"
          }
        ],
        "calories": 748.3119576000635,
        "totalCO2Emissions": 4683.264225233496,
        "co2EmissionsClass": "E",
        "totalWeight": 676.4905321666862,
        "totalTime": 0,
        "cuisineType": [
          "american"
        ],
        "mealType": [
          "lunch/dinner"
        ],
        "dishType": [
          "sandwiches"
        ],
        "totalNutrients": {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 748.3119576000635,
            "unit": "kcal"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 36.49068825033447,
            "unit": "g"
          },
          "FASAT": {
            "label": "Saturated",
            "quantity": 9.444934311500159,
            "unit": "g"
          },
          "FATRN": {
            "label": "Trans",
            "quantity": 0.4672001411,
            "unit": "g"
          },
          "FAMS": {
            "label": "Monounsaturated",
            "quantity": 12.640217818000092,
            "unit": "g"
          },
          "FAPU": {
            "label": "Polyunsaturated",
            "quantity": 10.601913973333938,
            "unit": "g"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 15.898506250013664,
            "unit": "g"
          },
          "CHOCDF.net": {
            "label": "Carbohydrates (net)",
            "quantity": 8.58399166667472,
            "unit": "g"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 7.314514583338944,
            "unit": "g"
          },
          "SUGAR": {
            "label": "Sugars",
            "quantity": 5.835781250008034,
            "unit": "g"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 92.64655105666876,
            "unit": "g"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 312.97873530000004,
            "unit": "mg"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 315.47181358668445,
            "unit": "mg"
          },
          "CA": {
            "label": "Calcium",
            "quantity": 154.06087016500882,
            "unit": "mg"
          },
          "MG": {
            "label": "Magnesium",
            "quantity": 143.8550392216839,
            "unit": "mg"
          },
          "K": {
            "label": "Potassium",
            "quantity": 1509.4212085670326,
            "unit": "mg"
          },
          "FE": {
            "label": "Iron",
            "quantity": 7.319780999667849,
            "unit": "mg"
          },
          "ZN": {
            "label": "Zinc",
            "quantity": 11.4497082195502,
            "unit": "mg"
          },
          "P": {
            "label": "Phosphorus",
            "quantity": 990.1475525000312,
            "unit": "mg"
          },
          "VITA_RAE": {
            "label": "Vitamin A",
            "quantity": 256.6654740002581,
            "unit": "µg"
          },
          "VITC": {
            "label": "Vitamin C",
            "quantity": 81.49502083333948,
            "unit": "mg"
          },
          "THIA": {
            "label": "Thiamin (B1)",
            "quantity": 0.3941891517000158,
            "unit": "mg"
          },
          "RIBF": {
            "label": "Riboflavin (B2)",
            "quantity": 0.8984900972002345,
            "unit": "mg"
          },
          "NIA": {
            "label": "Niacin (B3)",
            "quantity": 32.41494712600169,
            "unit": "mg"
          },
          "VITB6A": {
            "label": "Vitamin B6",
            "quantity": 2.9052373418001585,
            "unit": "mg"
          },
          "FOLDFE": {
            "label": "Folate equivalent (total)",
            "quantity": 78.46802840000997,
            "unit": "µg"
          },
          "FOLFD": {
            "label": "Folate (food)",
            "quantity": 78.46802840000997,
            "unit": "µg"
          },
          "FOLAC": {
            "label": "Folic acid",
            "quantity": 0,
            "unit": "µg"
          },
          "VITB12": {
            "label": "Vitamin B12",
            "quantity": 4.5429237,
            "unit": "µg"
          },
          "VITD": {
            "label": "Vitamin D",
            "quantity": 1.8493694800000002,
            "unit": "µg"
          },
          "TOCPHA": {
            "label": "Vitamin E",
            "quantity": 4.094365216333947,
            "unit": "mg"
          },
          "VITK1": {
            "label": "Vitamin K",
            "quantity": 15.294800000021116,
            "unit": "µg"
          },
          "WATER": {
            "label": "Water",
            "quantity": 528.7235159261681,
            "unit": "g"
          }
        },
        "totalDaily": {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 37.415597880003176,
            "unit": "%"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 56.139520385129956,
            "unit": "%"
          },
          "FASAT": {
            "label": "Saturated",
            "quantity": 47.2246715575008,
            "unit": "%"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 5.299502083337888,
            "unit": "%"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 29.258058333355777,
            "unit": "%"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 185.2931021133375,
            "unit": "%"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 104.32624510000001,
            "unit": "%"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 13.144658899445185,
            "unit": "%"
          },
          "CA": {
            "label": "Calcium",
            "quantity": 15.406087016500882,
            "unit": "%"
          },
          "MG": {
            "label": "Magnesium",
            "quantity": 34.25119981468664,
            "unit": "%"
          },
          "K": {
            "label": "Potassium",
            "quantity": 32.11534486312835,
            "unit": "%"
          },
          "FE": {
            "label": "Iron",
            "quantity": 40.66544999815471,
            "unit": "%"
          },
          "ZN": {
            "label": "Zinc",
            "quantity": 104.08825654136545,
            "unit": "%"
          },
          "P": {
            "label": "Phosphorus",
            "quantity": 141.4496503571473,
            "unit": "%"
          },
          "VITA_RAE": {
            "label": "Vitamin A",
            "quantity": 28.518386000028674,
            "unit": "%"
          },
          "VITC": {
            "label": "Vitamin C",
            "quantity": 90.55002314815498,
            "unit": "%"
          },
          "THIA": {
            "label": "Thiamin (B1)",
            "quantity": 32.84909597500131,
            "unit": "%"
          },
          "RIBF": {
            "label": "Riboflavin (B2)",
            "quantity": 69.11462286155651,
            "unit": "%"
          },
          "NIA": {
            "label": "Niacin (B3)",
            "quantity": 202.59341953751058,
            "unit": "%"
          },
          "VITB6A": {
            "label": "Vitamin B6",
            "quantity": 223.47979552308908,
            "unit": "%"
          },
          "FOLDFE": {
            "label": "Folate equivalent (total)",
            "quantity": 19.617007100002493,
            "unit": "%"
          },
          "VITB12": {
            "label": "Vitamin B12",
            "quantity": 189.2884875,
            "unit": "%"
          },
          "VITD": {
            "label": "Vitamin D",
            "quantity": 12.329129866666669,
            "unit": "%"
          },
          "TOCPHA": {
            "label": "Vitamin E",
            "quantity": 27.29576810889298,
            "unit": "%"
          },
          "VITK1": {
            "label": "Vitamin K",
            "quantity": 12.745666666684263,
            "unit": "%"
          }
        },
        "digest": [
          {
            "label": "Fat",
            "tag": "FAT",
            "schemaOrgTag": "fatContent",
            "total": 36.49068825033447,
            "hasRDI": true,
            "daily": 56.139520385129956,
            "unit": "g",
            "sub": [
              {
                "label": "Saturated",
                "tag": "FASAT",
                "schemaOrgTag": "saturatedFatContent",
                "total": 9.444934311500159,
                "hasRDI": true,
                "daily": 47.2246715575008,
                "unit": "g"
              },
              {
                "label": "Trans",
                "tag": "FATRN",
                "schemaOrgTag": "transFatContent",
                "total": 0.4672001411,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Monounsaturated",
                "tag": "FAMS",
                "schemaOrgTag": nil,
                "total": 12.640217818000092,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Polyunsaturated",
                "tag": "FAPU",
                "schemaOrgTag": nil,
                "total": 10.601913973333938,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              }
            ]
          },
          {
            "label": "Carbs",
            "tag": "CHOCDF",
            "schemaOrgTag": "carbohydrateContent",
            "total": 15.898506250013664,
            "hasRDI": true,
            "daily": 5.299502083337888,
            "unit": "g",
            "sub": [
              {
                "label": "Carbs (net)",
                "tag": "CHOCDF.net",
                "schemaOrgTag": nil,
                "total": 8.58399166667472,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Fiber",
                "tag": "FIBTG",
                "schemaOrgTag": "fiberContent",
                "total": 7.314514583338944,
                "hasRDI": true,
                "daily": 29.258058333355777,
                "unit": "g"
              },
              {
                "label": "Sugars",
                "tag": "SUGAR",
                "schemaOrgTag": "sugarContent",
                "total": 5.835781250008034,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              },
              {
                "label": "Sugars, added",
                "tag": "SUGAR.added",
                "schemaOrgTag": nil,
                "total": 0,
                "hasRDI": false,
                "daily": 0,
                "unit": "g"
              }
            ]
          },
          {
            "label": "Protein",
            "tag": "PROCNT",
            "schemaOrgTag": "proteinContent",
            "total": 92.64655105666876,
            "hasRDI": true,
            "daily": 185.2931021133375,
            "unit": "g"
          },
          {
            "label": "Cholesterol",
            "tag": "CHOLE",
            "schemaOrgTag": "cholesterolContent",
            "total": 312.97873530000004,
            "hasRDI": true,
            "daily": 104.32624510000001,
            "unit": "mg"
          },
          {
            "label": "Sodium",
            "tag": "NA",
            "schemaOrgTag": "sodiumContent",
            "total": 315.47181358668445,
            "hasRDI": true,
            "daily": 13.144658899445185,
            "unit": "mg"
          },
          {
            "label": "Calcium",
            "tag": "CA",
            "schemaOrgTag": nil,
            "total": 154.06087016500882,
            "hasRDI": true,
            "daily": 15.406087016500882,
            "unit": "mg"
          },
          {
            "label": "Magnesium",
            "tag": "MG",
            "schemaOrgTag": nil,
            "total": 143.8550392216839,
            "hasRDI": true,
            "daily": 34.25119981468664,
            "unit": "mg"
          },
          {
            "label": "Potassium",
            "tag": "K",
            "schemaOrgTag": nil,
            "total": 1509.4212085670326,
            "hasRDI": true,
            "daily": 32.11534486312835,
            "unit": "mg"
          },
          {
            "label": "Iron",
            "tag": "FE",
            "schemaOrgTag": nil,
            "total": 7.319780999667849,
            "hasRDI": true,
            "daily": 40.66544999815471,
            "unit": "mg"
          },
          {
            "label": "Zinc",
            "tag": "ZN",
            "schemaOrgTag": nil,
            "total": 11.4497082195502,
            "hasRDI": true,
            "daily": 104.08825654136545,
            "unit": "mg"
          },
          {
            "label": "Phosphorus",
            "tag": "P",
            "schemaOrgTag": nil,
            "total": 990.1475525000312,
            "hasRDI": true,
            "daily": 141.4496503571473,
            "unit": "mg"
          },
          {
            "label": "Vitamin A",
            "tag": "VITA_RAE",
            "schemaOrgTag": nil,
            "total": 256.6654740002581,
            "hasRDI": true,
            "daily": 28.518386000028674,
            "unit": "µg"
          },
          {
            "label": "Vitamin C",
            "tag": "VITC",
            "schemaOrgTag": nil,
            "total": 81.49502083333948,
            "hasRDI": true,
            "daily": 90.55002314815498,
            "unit": "mg"
          },
          {
            "label": "Thiamin (B1)",
            "tag": "THIA",
            "schemaOrgTag": nil,
            "total": 0.3941891517000158,
            "hasRDI": true,
            "daily": 32.84909597500131,
            "unit": "mg"
          },
          {
            "label": "Riboflavin (B2)",
            "tag": "RIBF",
            "schemaOrgTag": nil,
            "total": 0.8984900972002345,
            "hasRDI": true,
            "daily": 69.11462286155651,
            "unit": "mg"
          },
          {
            "label": "Niacin (B3)",
            "tag": "NIA",
            "schemaOrgTag": nil,
            "total": 32.41494712600169,
            "hasRDI": true,
            "daily": 202.59341953751058,
            "unit": "mg"
          },
          {
            "label": "Vitamin B6",
            "tag": "VITB6A",
            "schemaOrgTag": nil,
            "total": 2.9052373418001585,
            "hasRDI": true,
            "daily": 223.47979552308908,
            "unit": "mg"
          },
          {
            "label": "Folate equivalent (total)",
            "tag": "FOLDFE",
            "schemaOrgTag": nil,
            "total": 78.46802840000997,
            "hasRDI": true,
            "daily": 19.617007100002493,
            "unit": "µg"
          },
          {
            "label": "Folate (food)",
            "tag": "FOLFD",
            "schemaOrgTag": nil,
            "total": 78.46802840000997,
            "hasRDI": false,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Folic acid",
            "tag": "FOLAC",
            "schemaOrgTag": nil,
            "total": 0,
            "hasRDI": false,
            "daily": 0,
            "unit": "µg"
          },
          {
            "label": "Vitamin B12",
            "tag": "VITB12",
            "schemaOrgTag": nil,
            "total": 4.5429237,
            "hasRDI": true,
            "daily": 189.2884875,
            "unit": "µg"
          },
          {
            "label": "Vitamin D",
            "tag": "VITD",
            "schemaOrgTag": nil,
            "total": 1.8493694800000002,
            "hasRDI": true,
            "daily": 12.329129866666669,
            "unit": "µg"
          },
          {
            "label": "Vitamin E",
            "tag": "TOCPHA",
            "schemaOrgTag": nil,
            "total": 4.094365216333947,
            "hasRDI": true,
            "daily": 27.29576810889298,
            "unit": "mg"
          },
          {
            "label": "Vitamin K",
            "tag": "VITK1",
            "schemaOrgTag": nil,
            "total": 15.294800000021116,
            "hasRDI": true,
            "daily": 12.745666666684263,
            "unit": "µg"
          },
          {
            "label": "Sugar alcohols",
            "tag": "Sugar.alcohol",
            "schemaOrgTag": nil,
            "total": 0,
            "hasRDI": false,
            "daily": 0,
            "unit": "g"
          },
          {
            "label": "Water",
            "tag": "WATER",
            "schemaOrgTag": nil,
            "total": 528.7235159261681,
            "hasRDI": false,
            "daily": 0,
            "unit": "g"
          }
        ]
      },
      "_links": {
        "self": {
          "title": "Self",
          "href": "https://api.edamam.com/api/recipes/v2/8cd4e6b1725143938313649aa5203616?type=public&app_id=157ce6bf&app_key=43ac9e1b47ecfec90d4fa6639740261f"
        }
      }
    }

    @recipe = Recipe.new(@recipe_attr, "thailand")
  end

  it "exists" do
    expect(@recipe).to be_a Recipe
    expect(@recipe.id).to eq(nil)
    expect(@recipe.title).to eq("Steamed Thailand Turkey Burger")
    expect(@recipe.url).to eq("https://food52.com/recipes/21104-steamed-thailand-turkey-burger")
    expect(@recipe.country).to eq("thailand")
    expect(@recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/d7a/d7aadde1ff6875e8d46f46c692691d73.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIGLd0cbATG7vOBWkMpcnB4vTvQOi4H%2BEjuwEhDj3c8pcAiEA8%2Bs82x1qKEkqMQpm2qeua%2F4F1ARgwt%2BzH7LTeyTermgquQUILxAAGgwxODcwMTcxNTA5ODYiDDSslw0XjUUzZ0iiqiqWBTN5M2hoJGAR6a7RG7upYGkc8Bt%2B%2FtFebbRioiDQpzAbxdoSRW6z4hIpJnfCdQOcqw%2BfKYRwfpBo8w3aL3dxx4JXbJkzbJhdLSHHDHxC4R71xUWRwwmzqRQcUjGXKr1alc2jdxlrILMRnUfGFVJECNZ0tXWhrcopcAv%2F9OSYaM7GEfg6Y2hszpOJBa6Lt8Z%2FOx8pCxbolkUBw70yu6pXoplI4RBLD6%2F33Uy99yO1jCEi10D6QHktRSxwre6Q0z%2Fqq7%2B1Wmh1BQ%2FgqCHFzWc9UN8clZLK1LiZm4banhzm0dA5Knkc5Q2OY7m2V3HdoNPSjSQEbyy7IPDuLQHL2briKsuNaHFthBYuLp02dLQiAS5aV68YRAuwO8YssfStdAt9lGkzC9gOKkLAkyqCDd%2F5OPaRfKAF%2FxcaGsrBfXRY%2FOp5pC78FA%2By6jelRXttcq4Rr5o6Mppq4nnIAoM4wiXcLve0kFMBCDApjmefcH8gNMyFhY%2BF%2BqFviYHykHDqxv%2Bt1lXhNhJaaXUj6XiazWCRlvwby5kSfUfGKO3L3DMkQ2CKhQ%2B9BxOJfdQ7bb6sCDH60MRM5KxHhzxaMLV8PZy6uh%2FTvaz3Zbi2y2s1TVr76qtqlvQkQ%2Bg7o8Z7g1g4iXNl1zYC2rXttvKNgpzRO8DRYLHNJTCZhy%2F89GOM9zFPlrRrHRXeJPqxdlT%2F6kVnGJwkLX989TJ%2B4eErHMHOUhtmZ%2BGRENE5wo%2B2E9i%2BfUavChtFGQk0MYPZXnsekaBoGL3I1joCvIrBQ1o2Hg5XGc7sT%2FsDa46WXYAtxcH2Ne6ZoIIXJuI5psNhPZ3OlK8BZIcv4%2B6%2BjZnaCFWLv5BYlmiIbIHdDx%2BX1C32xc7w2g0OoKwptexc%2BnvnMJzhlrMGOrEBHiWl%2FyYXU2KpJUc5SSXEgTBs%2BQHau7gVl7PDVxKafA1gqN%2BznbkYqnU6COpKSJVHDjasRQLbN0QkQkLeTKaE4lslANcMQFnwxe4RMWUZVdbN49h59JaXVJnzCSaAVijrrb05c9AsTiXOIE0Ha4e%2F%2FfGrKXAGi3Tze7TzfB1hU39VUdxBDBkdep10VmSuFspLKbInEf5%2FdgZ%2F3Tf0RXwNAZEUkv8PBJTqLQgFCYmKOkT7&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240609T153100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFM7S6HFMN%2F20240609%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=8b8b1fb79fc6a62d2f309528ddf4d333b1941822dc0acb877a89caa7e701a2f2")
  end
end