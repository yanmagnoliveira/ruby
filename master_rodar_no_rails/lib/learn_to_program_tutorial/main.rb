module Main
  #
  #  MAIN PAGE GENERATION
  #
  
  def generate
    srand
    chapNum   = @cgi.params['Chapter'][0]
    chapter   = @chapters[chapNum]
    chapTitle = 'Aprenda a Programar, por Chris Pine'
    if chapter
      chapTitle = chapNum + '.&nbsp;&nbsp;' if chapNum < 'A'
      chapTitle.sub! /^0/, ''
      chapTitle += chapter[0]
    end
    
    puts '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">'
    html(:lang=>'pt_br') do
      head do
        meta('http-equiv'=>"Content-Type", :content=>"text/html; charset=utf-8")
      	
        link(:href=>LINKADDR+'stylesheets/pine.css', :rel=>'Stylesheet', :type=>'text/css', :media=>'screen')
        link(:href=>LINKADDR+'stylesheets/tutorial.css', :rel=>'Stylesheet', :type=>'text/css', :media=>'screen, print')
        link(:href=>LINKADDR+'stylesheets/print.css', :rel=>'Stylesheet', :type=>'text/css', :media=>'print')
        title { chapTitle }
        script(:language=>'JavaScript', :src=>'http://www.gvisit.com/record.php?sid=6941c11eba5c874197e2096f9c854106', :type=>'text/javascript') {}
      end # head
      body do
      div(:id=>'pageWidth') do
        div(:id=>'headerBar') do
          div(:id=>'titlePicContainer') do
            puts '<a href="'+LINKADDR+'">'
            img(:id=>'titlePic', :width=>'500', :height=>'108', :src=>'images/titleLTP_pt_br.gif', :alt=>'Aprenda a Programar')
            puts '</a>'
          end
          puts '<a href="'+LINKADDR+'">'
          puts '  <img id="locket" width="82" height="82" alt="apenas uma figura bonitinha"'
          puts '    src="images/locketLTP.png" />'
          puts '</a>'
        end
        div(:id=>'menuPane') do
          img(:id=>'menuSpearTop', :width=>'35', :height=>'38', :src=>'images/spearup_sm.gif')
          
          menuBookLink
          
          img(:width=>'64', :height=>'21', :style=>'padding: 30px;', :src=>'images/swirly.gif')
          
          menuTOC
          
          img(:id=>'menuSpearBottom', :width=>'36', :height=>'40', :src=>'images/speardown_sm.gif')
        end
        div(:id=>'contentPane') do
          if chapter
            if chapter[0]
              h1 {chapTitle}
              puts HLINE
            end
            method(chapter[1]).call
          else # TOC
            h2 { "Notas sobre a tradu????o em Portugu??s Brasileiro"}
            para do <<-END_PARAGRAPH
              Todo comunidade de programa????o ?? formada pelos amantes de computa????o, que aprendem linguagens
              novas no caf??-da-manh??, mas tamb??m uma uma grande parcela de pessoas que foram empolgadas por
              n??s mas acabam esbarrando na barreira inicial do aprendizado. Felizmente autores como Chris
              Pine resolveram atacar este desafio e o resultado que temos ?? uma excelente material para 
              programadores iniciantes em Ruby.
              END_PARAGRAPH
            end

            para do <<-END_PARAGRAPH
              Eu, <b>Fabio Akita</b>, <a href="http://www.akitaonrails.com/2008/1/15/vamos-traduzir-o-learn-to-program">surgi</a>
              com esta sugest??o em Janeiro de 2008. Fiz o an??ncio no meu blog e na lista rails-br e foi um
              movimento incr??vei: dezenas de volunt??rios se candidataram a ajudar. Gra??as a isso a tradu????o
              e revis??o n??o durou uma semana! Fico extremamente satisfeito em ter essa amostra da
              comunidade se auto-ajudando. Espero ter a oportunidade de conduzir mais trabalhos desta
              natureza.
              END_PARAGRAPH
            end

            para do <<-END_PARAGRAPH
              Meus agradecimentos e parab??ns aos tradutores/revisores: 
              <a href="http://www.dtsato.com/">Danilo Sato</a>,
              <a href="http://presto.stellar.com.br/">Davi Vidal</a>, 
              <a href="mailto:bagrehc@gmail.com">Reginaldo Russinholi</a>, 
              <a href="http://www.oliverbarnes.com/">Oliver Azevedo Barnes</a>, 
              <a href="https://github.com/dodecaphonic">Vitor Peres</a>, 
              <a href="mailto:pflarini@gmail.com">Paulo Fernando Larini</a>, 
              Massimiliano Giroldi, 
              <a href="http://blog.shadowmaru.org/">Ricardo Yasuda</a>, 
              <a href="http://makemesimple.com/blog/">Lucas H??ngaro</a>, 
              Anderson Leite.
              
              Agrade??o tamb??m a todos que se voluntariaram, mas havia mais colaboradores que cap??tulos para
              traduzir e sobrou gente :-) Acho que ?? um bom sinal!
              END_PARAGRAPH
            end

            para do <<-END_PARAGRAPH
              Agradecimentos tamb??m ao <a href="http://www.jmonteiro.com/">J??lio Santos Monteiro</a> por dar uma "casa" oficial a este trabalho no
              web site <a href="http://aprendaaprogramar.rubyonrails.com.br" title="Aprenda a Programar">http://aprendaaprogramar.rubyonrails.com.br</a>.
              END_PARAGRAPH
            end

            para do <<-END_PARAGRAPH
              Esperamos que o resultado deste trabalho seja de grande valia tanto a estudantes quanto
              a qualquer um que queira ensinar outros a programar.
              END_PARAGRAPH
            end
            puts HLINE

            h2 { 'Um lugar para o futuro programador come??ar' }
            para do <<-END_PARAGRAPH
              Eu acho que tudo isso come??ou em 2002. Eu estava pensando
              em ensinar programa????o, e como uma grande linguagem como
              Ruby seria ??tima para aprender a como programar.  Quer dizer, n??s est??vamos
              todos excitados com Ruby pelo seu poder, eleg??ncia e por ser realmente divertido,
              mas me pareceu que ele tamb??m seria um excelente guia para aprender a programar.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Infelizmente, n??o havia muita documenta????o sobre Ruby
              destinada aos iniciantes naquela ??poca. Alguns de n??s,
              na comunidade, est??vamos falando sobre como um tutorial 
              "Ruby for the Nuby" era necess??rio,
              e, mais genericamente, um tutorial ensinando a programar, como um todo.
              Quanto mais eu pensava nisso, mais eu tinha a dizer (o que me surpreendeu
              um pouco). At?? que algu??m finalmente disse: "Chris, porque voc??
              n??o escreve um tutorial ao inv??s de ficar falando sobre isso?".
              Ent??o eu o fiz.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              E isso n??o foi muito bom. Eu tive todas essas boas id??ias que eram boas
              <em>em teoria</em>, mas a real tarefa de fazer um grande tutorial
              para n??o-programadores foi muito mais desafiadora
              do que eu poderia prever. (Quer dizer, pareciam boas para mim, mas eu j??
              sabia como programar.)
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              O que me salvou foi que eu fiz com que fosse f??cil para as pessoas
              falarem comigo, e eu sempre tentei ajudar as pessoas quando elas empacavam.
              Quando eu via um monte de gente empacando em uma parte,
              eu a reescrevia. Isso deu muito trabalho, mas lentamente foi se tornando melhor
              e melhor.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Alguns anos depois, isso estava ficando realmente bom.  :-) T??o bom,
              na verdade, que eu j?? estava pronto para anunciar sua finaliza????o e
              partir para outra coisa. E justamente nesse instante houve a
              oportunidade de transformar esse tutorial em um livro. Uma vez que o b??sico
              j?? estava pronto, eu achei que n??o haveria maiores problemas.
              Eu apenas precisaria esclarecer umas coisas, adicionar alguns exerc??cios extras,
              talvez mais alguns exemplos, um pouquinho mais de cap??tulos, enviar ele para
              uns 50 revisores...
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Isso me tomou outro ano, mas agora eu acho que est?? realmente
              <em>muito</em> bom, grande parte gra??as ??s centenas
              de boas almas que me ajudaram a escrever este livro.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              O que est?? nesse site ?? o tutorial original, quase inalterado
              desde 2004. Para o melhor e mais atualizado, voc?? pode
              querer dar uma olhada <a href="#{FRLTP_ADDR}">no livro</a>.
              END_PARAGRAPH
            end
            puts HLINE
            h2 { 'Notas Para Professores' }
            para do <<-END_PARAGRAPH
              H?? algumas normas de conduta que eu tentei seguir.
              Eu acho que elas tornam o processo de aprendizado muito mais suave;
              ensinar a programar j?? ?? dif??cil por si s??. Se voc?? est??
              ensinando ou guiando algu??m pelas vias hackers, essas id??ias podem lhe ajudar tamb??m.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Primeiramente, eu tentei separar os conceitos o m??ximo poss??vel,
              assim o estudante tem que aprender apenas um conceito de cada vez.
              Isso foi dif??cil no come??o, mas um <em>pouco</em> mais f??cil
              depois que eu peguei a pr??tica. Algumas coisas devem ser faladas
              antes de outras, mas eu fiquei impressionado com qu??o pouca
              hierarquia de preced??ncia realmente existe. Eventualmente, eu apenas tive que
              seguir uma ordem, e eu tentei arrumar as coisas de tal maneira
              que cada nova se????o fosse motivada pela anterior.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Outro princ??pio que eu tinha em mente era de ensinar apenas uma maneira
              de fazer alguma coisa. Isso ?? um benef??cio ??bvio em um tutorial
              para pessoas que nunca programaram antes. Por um motivo:
              ?? mais f??cil aprender uma maneira de fazer uma coisa do que duas. Por??m
              o benef??cio mais importante ?? que quanto menos coisas voc??
              ensinar a um novo programador, mais criativo e esperto
              ele tem que ser na programa????o. J?? que muito da programa????o
              ?? resolu????o de problemas, torna-se crucial o encorajamento em todos os est??gios
              poss??veis.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Eu tentei tra??ar um paralelo entre os conceitos de programa????o
              com os conceitos que um novo programador j?? possui;
              para apresentar as id??ias de uma maneira que o entendimento seja
              intuitivo, ao inv??s do tutorial despejar apenas informa????es.
              Programa????o Orientada a Objetos faz isso, por si s??, muito bem.
              Eu fui capaz de me referir a "objetos" e diferentes "tipos de objetos"
              muito rapidamente nesse tutorial, soltando tais informa????es nos mais
              inocentes momentos. Eu n??o falei nada do tipo "tudo em Ruby ?? um objeto"
              ou "n??meros e strings s??o tipos de objetos", porque essas
              coisas n??o dizem nada para um novo programador. Ao inv??s disso,
              eu vou falar sobre strings (e n??o sobre "objetos do tipo string"),
              e algumas vezes eu vou me referir a "objetos", apenas no sentido de "as coisas
              nesses programas". O fato de que todas essas <em>coisas</em> em Ruby <em>s??o</em>
              objetos fez com que esse tipo de inconsist??ncia da minha parte funcionasse t??o bem.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Sobretudo, eu procurei fugir do jarg??o desnecess??rio da
              OO, eu procurei ter certeza de que, se eles t??m de aprender
              uma palavra, que aprendam a certa (Eu n??o quero que eles
              tenham de aprender em duplicidade, certo?). Ent??o, eu chamei
              tudo de "strings", e n??o "texto". M??todos precisam ser chamados
              de alguma coisa, ent??o eu os chamei de m??todos.
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              A medida que os exerc??cios foram sendo concebidos, eu achei
              que estava com bons exerc??cios, mas voc?? nunca pode colocar
              exerc??cios demais. Honestamente, eu acho que eu gastei quase
              metade do meu tempo apenas tentando fazer exerc??cios divertidos
              e interessantes. Exerc??cios entediantes apenas aniquilam qualquer
              desejo de programar, enquanto que o exerc??cio perfeito cria
              aquela coceira no programador novo que ele n??o consegue ficar sem
              co??ar. Resumindo, n??o gaste muito tempo tentando fazer exerc??cios bons.
              END_PARAGRAPH
            end
            puts HLINE
            h2 { 'Sobre o Tutorial Original' }
            para do <<-END_PARAGRAPH
              As p??ginas do tutorial (esta p??gina, inclusive) s??o geradas por um
              <a href="https://github.com/jmonteiro/aprendaaprogramar">grande programa em Ruby</a>,
              claro. :-)
              Assim, elas possuem recursos elegantes. Por exemplo, todos os
              exemplos de c??digo s??o realmente executados toda vez que voc??
              v?? a p??gina, e a sa??da dos mesmos ?? a sa??da que eles geram.
              Eu acredito que essa ?? a maneira mais f??cil, melhor e, certamente, a
              mais legal de ter certeza que todo o c??digo mostrado
              funciona <em>exatamente</em> como eu digo que funciona.
              Voc?? n??o precisa se preocupar com a possibilidade de eu ter copiado
              a sa??da de um exemplo erroneamente ou esquecido de testar um c??digo:
              tudo ?? testado na hora que voc?? v??. Ent??o, na se????o de geradores de
              n??meros aleat??rios, voc?? vai ver que os n??meros mudam sempre... <em>lindo</em>.
              (Eu usei um truque parecido na hora de escrever o livro, mas ?? ??bvio que isso
              ?? muito mais aparente aqui no tutorial.)
              END_PARAGRAPH
            end
            h2 { "Sobre o Material Traduzido" }
            para do <<-END_PARAGRAPH
              O c??digo original descrito por Chris Pine acima, era uma vers??o simples e implementada sobre
              CGI. Em total ritmo de 2008, eu mesmo (Fabio Akita) modifiquei esse c??digo. Sem muitas 
              modifica????es sobre o original, transportei o c??digo para rodar sobre Rails 2.0.2.
              END_PARAGRAPH
            end

            para do <<-END_PARAGRAPH
              Esse c??digo est?? todo dispon??vel no GitHub, neste endere??o:
              END_PARAGRAPH
            end

            para do <<-END_PARAGRAPH
              <em>https://github.com/jmonteiro/aprendaaprogramar</em>
              END_PARAGRAPH
            end

            para do <<-END_PARAGRAPH
              Por motivos de performance, os c??digos (que localmente s??o realmente executados em tempo real
              conforme Chris explicou) n??o s??o executados online, sendo uma c??pia est??tica. Para ter todos os
              benef??cios do programa em tempo real, baixe o c??digo para rodar sobre Rails.
              END_PARAGRAPH
            end
            para do
              '<a href="http://ruby-lang.org">'+
                '<img src="images/PoweredByRuby.png" alt="powered by Ruby" width="234" height="60" />'+
              '</a>'
            end
            puts HLINE
            h2 { 'Agradecimentos' }
            para do <<-END_PARAGRAPH
              Finalizando, eu gostaria de agradecer a todos da lista ruby-talk
              por suas id??is e pelo encorajamento, aos meus maravilhosos
              revisores, por sua ajuda em fazer o livro muito melhor do que
              eu poderia fazer sozinho, especialmente ?? minha querida esposa,
              por ser minha principal revisora/testadora/cobaia/musa, ao Matz,
              por ter criado essa fabulosa linguagem, e aos Pragmatic Programmers, por
              me falar sobre a linguagem&mdash;e, ?? claro, por publicar meu livro!
              END_PARAGRAPH
            end
            para do <<-END_PARAGRAPH
              Se voc?? notar qualquer erro ou falha de digita????o, se tiver
              qualquer coment??rio ou sugest??o, ou um bom exerc??cio que eu possa
              incluir, por favor <a href="mailto:chris@pine.fm">me avise</a> (se voc?? falar
              ingl??s) ou, se preferir falar em portugu??s,
              <a href="mailto:julio@monteiro.eti.br">avise o J??lio Monteiro</a>.
              END_PARAGRAPH
            end
          end
          
          puts HLINE
          para(:style=>'padding-bottom: 20px;') { "&copy; 2003-#{Time.now.year} Chris Pine" }
        end # contentPane
      end # pageWidth
      end # body
    end # html
  end
end
