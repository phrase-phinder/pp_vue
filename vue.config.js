const fs = require('fs')

module.exports = {
    devServer: {
        https: {
          key: fs.readFileSync('ssl/private.key'),
          cert: fs.readFileSync('ssl/certificate.crt'),
        },
        public: 'https://phrasephinder.com'
    }
}