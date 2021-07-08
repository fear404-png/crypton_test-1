Ссылка на дизайн - https://www.figma.com/file/asNV3uTwdsfuCluYASNF9x/FF-test

Нужно сверстать экраны по дизайну.
 

Требования к экрану Login:

    Кнопка ‘Sign in’ должна быть не активна, пока все поля не заполнены.

    После заполнения всех полей кнопка становится активной.

    При нажатие на кнопку данные в полях должны валидироваться.

 

Условия валидации.

    Проверка на Nickname. Проверить, что поле не пустое, и содержит только символы латинского алфавита или “_” (underscore)

    Длина пароля должна быть от 3 до 9 символа.

 

Если все условия валидации пройдены, происходит навигация на страницу Main.
 

Требования к экрану Main:

    добавить навигацию через bottomNavigationBar. Экраны, которых нет в дизайне заменить на пустые контейнеры.
     

Требования к экрану  News:

    При входе на экран запрашивать новости через REST API. Пока данные загружаются показывать индикатор загрузки. Можно не верстать новости с картинками. 

 

Для получения access токена -

https://app.ferfit.club/api/auth/refresh-tokens | POST

Bearer - eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8
 

body - пустой
 

Получение списка новостей:

https://app.ferfit.club/api/feed?limit=10&offset=0&maxDate=2021-05-06T18:26:42.820994

Для работы с этим запросов необходима авторизация через Bearer токен. Bearer токен приходит из вышестоящего запроса в поле access.