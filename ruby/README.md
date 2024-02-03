### How to run
    
    ruby task_manager.rb
    
    rspec

### Project structure:

```agsl
ruby/
│
├── Gemfile                   # Project dependencies using Bundler
├── Gemfile.lock
├── Rakefile                  # Define custom Rake tasks
├── README.md
├── config/
│   ├── application.yml       # Shared configuration files
│   ├── database.yml          # Database configuration
│   └── environment.rb        # Environment setup
│
├── lib/
│   ├── my_ruby_project.rb    # Main module file
│   ├── task_manager/         # Application One
│   │   └── task_manager.rb   # Application One main file
│   │
│   ├── app_two/              # Application Two
│   │   ├── controllers/
│   │   │   └── ...
│   │   ├── models/
│   │   │   └── ...
│   │   ├── views/
│   │   │   └── ...
│   │   └── app_two.rb        # Application Two main file
│   │
│   └── shared/               # Shared code/modules
│       ├── helpers/
│       │   └── ...
│       ├── middleware/
│       │   └── ...
│       └── services/
│           └── ...
│
├── spec/
│   ├── app_one_spec.rb       # Tests for Application One
│   ├── app_two_spec.rb       # Tests for Application Two
│   └── spec_helper.rb        # Shared test setup
│
└── tasks/
    ├── app_one_tasks.rake    # Rake tasks for Application One
    └── app_two_tasks.rake    # Rake tasks for Application Two
```