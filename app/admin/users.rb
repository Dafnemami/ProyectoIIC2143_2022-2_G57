ActiveAdmin.register User do
  permit_params :email, :password, :name, :last_name, :run, :phone, :address, :birth_date, :pay_method

end
