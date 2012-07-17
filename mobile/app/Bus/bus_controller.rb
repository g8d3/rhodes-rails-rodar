require 'rho/rhocontroller'
require 'helpers/browser_helper'

class BusController < Rho::RhoController
  include BrowserHelper

  # GET /Bus
  def index
    @buses = Bus.find(:all)
    render :back => '/app'
  end

  # GET /Bus/{1}
  def show
    @bus = Bus.find(@params['id'])
    if @bus
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Bus/new
  def new
    @bus = Bus.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Bus/{1}/edit
  def edit
    @bus = Bus.find(@params['id'])
    if @bus
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Bus/create
  def create
    @bus = Bus.create(@params['bus'])
    redirect :action => :index
  end

  # POST /Bus/{1}/update
  def update
    @bus = Bus.find(@params['id'])
    @bus.update_attributes(@params['bus']) if @bus
    redirect :action => :index
  end

  # POST /Bus/{1}/delete
  def delete
    @bus = Bus.find(@params['id'])
    @bus.destroy if @bus
    redirect :action => :index  
  end
end
