'use strict';

const path = require('path');

const HtmlWebpackPlugin = require('html-webpack-plugin');

const webpack = require('webpack');

const isWebpackDevServer = process.argv.some(a => path.basename(a) === 'webpack-dev-server');

const isWatch = process.argv.some(a => a === '--watch');

const plugins =
  isWebpackDevServer || !isWatch ? [] : [
    function(){
      this.plugin('done', function(stats){
        process.stderr.write(stats.toString('errors-only'));
      });
    }
  ]
;

const cssLoaders = [
  !isWebpackDevServer? MiniCssExtractPlugin.loader : 'style-loader',
  { loader: 'css-loader', options: { sourceMap: isWebpackDevServer } },
  { loader: 'postcss-loader', options: { sourceMap: isWebpackDevServer } },
  { loader: 'stylus-loader', options: { sourceMap: isWebpackDevServer } }
]


module.exports = {
  devtool: 'eval-source-map',

  devServer: {
    contentBase: path.resolve(__dirname, 'dist'),
    port: 4008,
    stats: 'errors-only',

  },

  entry: './src/entrypoint.js',

  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js',
    publicPath: "/"
  },

  module: {
    rules: [
      {
        test: /\.purs$/,
        use: [
          {
            loader: 'purs-loader',
            options: {
              src: [
                'src/**/*.purs'
              ],
              spago: true,
              watch: isWebpackDevServer || isWatch,
              pscIde: true
            }
          }
        ]
      },
      { test: /\.jpg$/, use: [ "file-loader" ] },
      { test: /\.png$/, use: [ "url-loader?mimetype=image/png" ] },
      {
        test: /\.css$/,
        use: [
          "style-loader",
          {
            loader: "css-loader",
            options: {
              modules: true
            }
          }
        ]
      },
      {
        test: /\.styl$/,
        use: [
          {
            loader: "style-loader" // creates style nodes from JS strings
          },
          {
            loader: "css-loader" // translates CSS into CommonJS
          },
          {
            loader: "stylus-loader" // compiles Stylus to CSS
          }
        ]
      },
      {
        test: /\.(html)$/,
        use: {
          loader: 'html-loader',
          options: {
            attrs: ['img:src']
          }
        }
      },
    ]
  },

  resolve: {
    modules: [ 'node_modules' ],
    extensions: [ '.purs', '.js']
  },

  plugins: [
    new webpack.LoaderOptionsPlugin({
      debug: true
    }),
    new HtmlWebpackPlugin({
      title: 'purescript-webpack-example',
      template: 'index.html'
    })
  ].concat(plugins),
};