export async function fetchData(url, id = null) {
    const fetchUrl = id ? `${url}/${id}` : url;
    
    try {
        const response = await fetch(fetchUrl);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('There was a problem with the fetch operation:', error.message);
        throw error;
    }
}
export function postData(url, data) {
    return fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        if (!response.ok) {
            // Log the response text for better debugging
            return response.text().then(text => {
                throw new Error(`HTTP error! Status: ${response.status}, Response: ${text}`);
            });
        }
        // Check if response is JSON and parse accordingly
        const contentType = response.headers.get('Content-Type');
        if (contentType && contentType.includes('application/json')) {
            return response.json();
        } else {
            return response.text();  // Return as text if not JSON
        }
    })
    .then(data => {
        // console.log('Response data:', data);
        return data;  // Return data for further processing if needed
    })
    .catch(error => {
        console.error('There was a problem with the fetch operation:', error.message);
        throw error;  // Re-throw error to handle it where the function is called
    });
}
