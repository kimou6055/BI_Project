# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django import template
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from django.urls import reverse
from django.shortcuts import render
from apps.home import profits_prediction as pred
from apps.home import apriori_prediction 
from apps.home import returned_predictions
from apps.home import clients_city_clusturing
import json

@login_required(login_url="/login/")
def index(request):
    
    data = pred.df_sales_pred.to_dict(orient='records')
    profit_pred = json.dumps(data, indent=2)
    data = pred.df_sales_pred2.to_dict(orient='records')
    profit_pred2 = json.dumps(data, indent=2)
    
    apriori = apriori_prediction.df_apriori.to_dict(orient='records')

    df_top10_returned = returned_predictions.df_top10_returned.to_dict(orient='records')

    
    data = returned_predictions.df_category_returned.to_dict(orient='records')
    df_category_returned = json.dumps(data, indent=2)
    
    data = returned_predictions.df_sub_category_returned.to_dict(orient='records')
    df_sub_category_returned = json.dumps(data, indent=2)
    
    data = clients_city_clusturing.Top5Customers.to_dict(orient='records')
    Top5Customers = json.dumps(data, indent=2)
    
    data = clients_city_clusturing.Top5localisation.to_dict(orient='records')
    Top5localisation = json.dumps(data, indent=2)
    
    return render(request, 'home/index.html',{'profit_pred':profit_pred,'profit_pred2':profit_pred2,'apriori':apriori,
                                              'df_top10_returned':df_top10_returned,'df_category_returned':df_category_returned,
                                              'df_sub_category_returned':df_sub_category_returned,
                                              'Top5Customers':Top5Customers,'Top5localisation':Top5localisation})


@login_required(login_url="/login/")
def pages(request):
    context = {}
    # All resource paths end in .html.
    # Pick out the html file name from the url. And load that template.
    try:

        load_template = request.path.split('/')[-1]

        if load_template == 'admin':
            return HttpResponseRedirect(reverse('admin:index'))
        context['segment'] = load_template

        html_template = loader.get_template('home/' + load_template)
        return HttpResponse(html_template.render(context, request))

    except template.TemplateDoesNotExist:

        html_template = loader.get_template('home/page-404.html')
        return HttpResponse(html_template.render(context, request))

    except:
        html_template = loader.get_template('home/page-500.html')
        return HttpResponse(html_template.render(context, request))
