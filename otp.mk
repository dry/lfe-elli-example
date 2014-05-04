include common.mk

dev:
	@echo "Running OTP app in the foreground ..."
	@ERL_LIBS=$(ERL_LIBS) $(LFE) -eval "application:start('lfe-elli-example')" \
	-noshell

run: dev

prod:
	@echo "Running OTP app in the background ..."
	@ERL_LIBS=$(ERL_LIBS) $(LFE) -eval "application:start('lfe-elli-example')" \
	-name lfe-elli-example@$${HOSTNAME} -setcookie `cat ~/.erlang.cookie` \
	-noshell -detached

daemon: prod

stop:
	@ERL_LIBS=$(ERL_LIBS) $(LFE) \
	-eval "rpc:call('lfe-elli-example@$${HOSTNAME}', init, stop, [])" \
	-name controller@$${HOSTNAME} -setcookie `cat ~/.erlang.cookie` \
	-noshell -s erlang halt
