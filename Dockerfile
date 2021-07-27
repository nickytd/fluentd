FROM fluent/fluentd-kubernetes-daemonset:v1.13-debian-kafka2-1
#FROM fluent/fluentd-kubernetes-daemonset:v1.12-debian-kafka-1

# Use root account to use apk
USER root

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish
RUN fluent-gem install fluent-plugin-elasticsearch && \
          fluent-gem install fluent-plugin-prometheus && \
          fluent-gem install fluent-plugin-dedot_filter && \
          fluent-gem install fluent-plugin-rewrite-tag-filter && \
          fluent-gem install fluent-plugin-record-modifier

USER fluent
