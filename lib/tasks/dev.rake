namespace :dev do
  desc "Configura ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco de dados") { %x(rails db:drop) }

      show_spinner("Criando banco de dados") {%x(rails db:create)}
      
      show_spinner("Rodando migrations") {%x(rails db:migrate)}

      %x(rails dev:add_mini_types) 
     %x(rails dev:add_coins) 
      
      
    else
      puts("Este comando só pode ser executado em ambiente de desenvolvimento")
    end
  end
 


desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando as moedas") do
      coins =  [
          {
          description: "Bitcoin",
          acronym: "BTC",
          img_url: "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png",
          mining_type: MiningType.find_by(acronym: "PoW")
          },
        
          {
          description: "Ethereum",
          acronym: "ETH",
          img_url: "https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png",
          mining_type: MiningType.all.sample

          },
        
          {
          description: "Dash",
          acronym: "DASH",
          img_url: "https://s2.coinmarketcap.com/static/img/coins/64x64/131.png",
          mining_type: MiningType.all.sample
          }
       ]
     
       coins.each do |coin|
          Coin.find_or_create_by!(coin)
   end
  end
end



desc "Cadastro do tipo de Mineração"
  task add_mini_types: :environment do
    show_spinner("Cadastrando os tipos de mineração") do
    mini_types = [
      {
        description: "Proof of Work",
        acronym: "PoW"
      },
      {
        description: "Proof of Stake",
        acronym: "PoS"
      },
      {
        description: "Proof of capacity",
        acronym: "PoC"
      },
    ]
    mini_types.each do |mini_type|
      MiningType.find_or_create_by!(mini_type)
    end
  end
end

  private
  
  def show_spinner(msg_start, msg_end = "Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
      yield
    spinner.success("(#{msg_end}!)")

  end 

end
