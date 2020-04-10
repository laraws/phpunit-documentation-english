FROM python AS sphinx_build
WORKDIR /app
ADD . /app
RUN pip3 install Sphinx sphinx_rtd_theme
RUN make html

FROM nginx
WORKDIR /usr/share/nginx/html
COPY --from=sphinx_build /app/build/html /usr/share/nginx/html
#RUN rm index.html && mv README.html index.html
