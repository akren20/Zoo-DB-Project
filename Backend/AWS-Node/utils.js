// backend/utils.js
// Getting the data from the front end

/**
 * Asynchronously gets the raw data from an HTTP request.
 * @param {Object} req - The HTTP request object from Express.
 * @returns {Promise<string>} A promise that resolves with the accumulated data as a string.
 */
async function getReqData(req) {
    return new Promise((resolve, reject) => {
        try {
            let body = '';
            // Listen to data sent by the client
            req.on('data', (chunk) => {
                // Append the string version of the chunk to the body
                body += chunk.toString();
            });
            // Listen for the end of the request
            req.on('end', () => {
                // Resolve the full body
                resolve(body);
            });
            // Handle any errors during the request
            req.on('error', (err) => {
                reject(new Error(`Error during request data collection: ${err.message}`));
            });
        } catch (error) {
            // Reject with the error if something goes wrong
            reject(new Error(`Error in getReqData function: ${error.message}`));
        }
    });
}

export default getReqData;
