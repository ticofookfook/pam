# Registrador de Credenciais SSH

## Visão Geral
Este script cria um gancho PAM (Pluggable Authentication Module) que captura credenciais de login SSH e as registra em um arquivo de texto simples. O script adiciona uma configuração PAM que intercepta dados de autenticação SSH e salva nomes de usuário, endereços IP de origem e senhas em um arquivo de log.

## Funcionalidades
- Captura credenciais de login SSH, incluindo nomes de usuário e senhas
- Registra endereços IP de origem (RHOST)
- Grava tipo de serviço, TTY e timestamp
- Armazena todos os dados em um arquivo de log em texto simples

## Instalação
1. Salve o script em um arquivo (ex: `ssh_logger.sh`)
2. Torne-o executável: `chmod +x ssh_logger.sh`
3. Execute o script com privilégios de root: `sudo ./ssh_logger.sh`

## Como Funciona
O script realiza as seguintes ações:
1. Cria um arquivo de log em `/var/log/ssh_login.log`
2. Adiciona uma linha de configuração PAM em `/etc/pam.d/sshd` que executa um script personalizado
3. Cria o script em `/root/pam.sh` que registra os detalhes de autenticação
4. Define permissões de execução para o script

## Formato do Arquivo de Log
O arquivo de log em `/var/log/ssh_login.log` contém entradas neste formato:
```
User: [nome_de_usuario]
RHOST: [ip_de_origem]
Service: [nome_do_servico]
TTY: [tty]
Date: [timestamp]
Password: [senha_em_texto_plano]
-----
```

## Aviso
**ALERTA DE SEGURANÇA:** Este script registra senhas em texto simples, o que representa riscos significativos de segurança:
- Senhas são armazenadas sem criptografia
- Arquivos de log podem ser acessados por usuários não autorizados
- Esta prática viola muitos padrões e políticas de segurança

**APENAS PARA FINS EDUCACIONAIS:** Esta ferramenta deve ser usada apenas em ambientes controlados para fins educacionais ou de teste. Não use em sistemas de produção ou sem autorização adequada.

## Aviso Legal
O uso deste script para coletar credenciais sem consentimento explícito de todas as partes pode violar leis de privacidade e estatutos de fraude informática em muitas jurisdições. Os usuários são responsáveis por garantir conformidade com todas as leis aplicáveis antes de usar este script.
