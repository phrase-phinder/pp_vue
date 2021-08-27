const fs = require('fs')

module.exports = {
    devServer: {
        https: {
          key: fs.readFileSync('phrasephinder.com+4-key.pem'),
          cert: fs.readFileSync('phrasephinder.com+4.pem'),
        },
        public: 'https://phrasephinder.com'
    }
}