class VehicleClassesController < ApplicationController
  def index
    vehicle_classes = VehicleClass.all
    render json: vehicle_classes, each_serializer: VehicleClassSerializer
  end
end
