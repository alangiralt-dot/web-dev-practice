<?php
declare(strict_types=1);

// 1. Specify the absolute path to your exercise folder
$fullPath = 'C:/xampp/htdocs/alan/tasca_s1_03/nivell_1/exercici_3/';

if (!is_dir($fullPath) || !is_writable($fullPath)) {
    exit("Error: The directory $fullPath is not ready for writing.");
}

// 2. Specify the files within that folder
$filePaths = glob($fullPath . "*.php");
$umlDiagram = $fullPath . 'diagram.puml';
if (file_exists($umlDiagram) && is_writable($umlDiagram)) {
    array_push($filePaths, $umlDiagram);
}

// 3. Specify where to save the result
$outputFile = 'C:/xampp/htdocs/alan/ai_info.txt';

$outputDir = dirname($outputFile);
if (!is_dir($outputDir) || !is_writable($outputDir)) {
    exit("Error: The directory $outputDir is not ready for writing.");
}

$handle = fopen($outputFile, 'w');

fwrite($handle, "--- DIRECTORY ---\n\n");
fwrite($handle, "All these files share the following directory:\n\n");
fwrite($handle, $fullPath . "\n\n");

foreach ($filePaths as $filePath) {
    $fileName = basename($filePath);
    fwrite($handle, "--- FILE: $fileName ---\n\n");
    fwrite($handle, file_get_contents($filePath) . "\n\n");
}

fclose($handle);
echo "Files merged into $outputFile" . PHP_EOL;