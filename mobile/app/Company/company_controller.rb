require 'rho/rhocontroller'
require 'helpers/browser_helper'

class CompanyController < Rho::RhoController
  include BrowserHelper

  # GET /Company
  def index
    @companies = Company.find(:all)
    render :back => '/app'
  end

  # GET /Company/{1}
  def show
    @company = Company.find(@params['id'])
    if @company
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Company/new
  def new
    @company = Company.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Company/{1}/edit
  def edit
    @company = Company.find(@params['id'])
    if @company
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Company/create
  def create
    @company = Company.create(@params['company'])
    redirect :action => :index
  end

  # POST /Company/{1}/update
  def update
    @company = Company.find(@params['id'])
    @company.update_attributes(@params['company']) if @company
    redirect :action => :index
  end

  # POST /Company/{1}/delete
  def delete
    @company = Company.find(@params['id'])
    @company.destroy if @company
    redirect :action => :index  
  end
end
