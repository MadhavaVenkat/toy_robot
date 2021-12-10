Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "robots#report"
  get 'api/robot/0/orders' , to: "robots#report"
end
