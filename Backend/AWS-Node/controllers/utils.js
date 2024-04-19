const fs = require('fs');

function writeDataToFile(filename, content) {
    try {
        fs.writeFileSync(filename, JSON.stringify(content), 'utf8');
    } catch (err) {
        console.log('Error writing file:', err);
    }
}

module.exports = {
    writeDataToFile
};
