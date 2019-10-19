Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'courses#index'
    get 'courses/new', to: 'courses#new'
    get 'about', to: 'courses#about'
    resources :courses, except: [:index, :new]
    get 'login', to: 'users#new'
    post 'login', to: 'users#create'
    delete 'logout', to: 'users#destroy'
    resources :students
    get 'loginstudent', to: 'sessions#new'
    post 'loginstudent', to: 'sessions#create'
    delete 'logoutstudent', to: 'sessions#destroy'
    post 'course_enroll', to: 'student_courses#create'
    get 'view_course', to: 'student_courses#show'
end
