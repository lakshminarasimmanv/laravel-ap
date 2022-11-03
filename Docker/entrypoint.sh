#!/bin/bash

set -e

if [ ! -f "vendor/autoload.php" ]; then
    composer install --no-progress --no-interaction --optimize-autoloader --no-dev
fi

php artisan migrate

