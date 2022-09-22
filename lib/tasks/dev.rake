namespace :dev do
  desc "Configura ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Apagando o Banco de dados...")
      spinner.auto_spin
      %x(rails db:drop)
      spinner.success("(Concluido com sucesso!)")  
      spinner = TTY::Spinner.new("[:spinner] Criando banco de Dados...")
      %x(rails db:create)   
      spinner.success("(Concluido com sucesso!)")
      spinner = TTY::Spinner.new("[:spinner] Miganrando as tabelas...")
      %x(rails db:migrate)
      spinner.success("(Concluido com sucesso!)")
      spinner = TTY::Spinner.new("[:spinner] Populando banco...")
      %x(rails db:seed)
      spinner.success("(Concluido com sucesso!)")
    else
      puts("Este comando só pode ser executado em ambiente de desenvolvimento")
    end
  end
end
