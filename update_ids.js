const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'assets', 'questions', 'c', 'c_traffic_safety.json');

fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
        console.error("Error reading file:", err);
        process.exit(1);
    }

    try {
        const questions = JSON.parse(data);
        let currentId = 700;

        const updatedQuestions = questions.map(q => {
            const newId = currentId++;
            return {
                ...q,
                id: newId,
                correctVideo: `assets/videos/correct_${newId}.mp4`,
                wrongVideo: `assets/videos/wrong_${newId}.mp4`,
                previewVideo: `assets/videos/preview_${newId}.mp4`,
            };
        });

        fs.writeFile(filePath, JSON.stringify(updatedQuestions, null, 2), 'utf8', (err) => {
            if (err) {
                console.error("Error writing file:", err);
                process.exit(1);
            } else {
                console.log("File updated successfully!");
            }
        });
    } catch (parseErr) {
        console.error("Error parsing JSON:", parseErr);
        process.exit(1);
    }
}); 