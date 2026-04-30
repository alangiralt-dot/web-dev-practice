<?php
declare(strict_types=1);

// 1. Specify the absolute path to your exercise folder
$fullPath = 'C:/xampp/htdocs/alan/tasca_s1_08/';

if (!is_dir($fullPath) || !is_writable($fullPath)) {
    exit("Error: The directory $fullPath is not ready for writing.");
}

// 2. Specify the files within that folder
$filePaths = glob($fullPath . "{src/*/*/*,tests/*/*/*,composer}.{php,html,css,puml,json}", GLOB_BRACE);

// 3. Specify where to save the result
$outputFile = 'C:/xampp/htdocs/alan/ai_info.txt';

$outputDir = dirname($outputFile);
if (!is_dir($outputDir) || !is_writable($outputDir)) {
    exit("Error: The directory $outputDir is not ready for writing.");
}

$handle = fopen($outputFile, 'w');

// --- PROJECT ARCHITECTURE AUDIT ---
$instructions = [
    "UML_CONSISTENCY: Cross-reference the provided PHP implementation with the .puml diagram to ensure 100% structural alignment.",
    "ENCAPSULATION_AUDIT: Validate that all properties and methods use the most restrictive Access Modifier (public/private/protected) possible.",
    "BEHAVIORAL_LOGIC: Verify the correct application of Non-Access Modifiers (abstract, static, final, readonly) based on class intent.",
    "CONSTRUCTOR_EVALUATION: Deep-dive into constructor logic, specifically auditing Property Promotion, inheritance chains, and state validation.",
    "TYPE_SAFETY: Confirm 'declare(strict_types=1);' presence and verify comprehensive type hinting for all parameters and return values.",
    "MEMORY_INTEGRITY: Evaluate the need for defensive copies (cloning) to prevent unintended external mutation of internal object state.",
    "EXCEPTION_HANDLING: Validate that input constraints are enforced via appropriate Exception types and descriptive error messages.",
    "ARCHITECTURAL_COHERENCE: Analyze the relationship between classes to ensure a logical and scalable project structure.",
    "SOLID_LSP: Verify that child classes can replace parent classes or interfaces without breaking the program's correctness.",
    "IDENTIFIER_AUDIT: Enforce descriptive, camelCase (methods/properties) and PascalCase (classes) naming. Flag non-descriptive names like '\$a' or '\$temp'.",
    "DESIGN_PRINCIPLES: Audit the codebase for SRP (Single Responsibility), DRY (Logic Duplication), and KISS (Simplicity). Flag over-engineered or redundant code."
];

fwrite($handle, "--- PROJECT ARCHITECTURE AUDIT ---\n\n");
fwrite($handle, "Please perform an exhaustive audit of the following points:\n\n");
foreach ($instructions as $index => $instruction) {
    fwrite($handle, ($index + 1) . ". " . $instruction . "\n");
}

// --- DIRECTORY TREE ---
fwrite($handle, "\n--- DIRECTORY TREE ---\n\n");
foreach ($filePaths as $filePath) {
  fwrite($handle, $filePath . "\n");
}
fwrite($handle, "\n");

// --- FILES SECTION ---
foreach ($filePaths as $filePath) {
    $fileName = basename($filePath);
    fwrite($handle, "--- FILE: $fileName ---\n\n");
    fwrite($handle, file_get_contents($filePath) . "\n\n");
}

fclose($handle);
echo "Files merged into $outputFile" . PHP_EOL;
