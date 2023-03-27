### 1. Задача 1
Архитектор ПО решил проконсультироваться у вас, какой тип БД лучше выбрать для хранения определенных данных.

Он вам предоставил следующие типы сущностей, которые нужно будет хранить в БД:

- Электронные чеки в json виде
- Склады и автомобильные дороги для логистической компании  
- Генеалогические деревья
- Кэш идентификаторов клиентов с ограниченным временем жизни для движка аутенфикации
- Отношения клиент-покупка для интернет-магазина  
Выберите подходящие типы СУБД для каждой сущности и объясните свой выбор.

> Ответ:
> - Электронные чеки в json виде  
NoSQL иерархические

> - Склады и автомобильные дороги для логистической компании  
NoSQL графовые

> - Генеалогические деревья  
Cетевые 

> - Кэш идентификаторов клиентов с ограниченным временем жизни для движка аутенфикации  
ключ-значение

> - Отношения клиент-покупка для интернет-магазина  
ключ значение

### 2. Задача 2
Вы создали распределенное высоконагруженное приложение и хотите классифицировать его согласно CAP-теореме. Какой классификации по CAP-теореме соответствует ваша система, если (каждый пункт - это отдельная реализация вашей системы и для каждого пункта надо привести классификацию):

- 1) Данные записываются на все узлы с задержкой до часа (асинхронная запись)
- 2) При сетевых сбоях, система может разделиться на 2 раздельных кластера
- 3) Система может не прислать корректный ответ или сбросить соединение  
А согласно PACELC-теореме, как бы вы классифицировали данные реализации?

> Ответ:  
>
Согласно САР
> - 1) PA
> - 2) CA
> - 3) СР

Согласно PACELC
> - PA/EL
> - PA/EL
> - PC/EC

### 3. Могут ли в одной системе сочетаться принципы BASE и ACID? Почему?

Я думаю, что нет, потому что эти принципы противоречат друг другу. Один - про то, чтобы работало и в конце концов согласовалось, второй - про жёсткую согласованность, которая превыше всего.

### 4. Задача 4
Вам дали задачу написать системное решение, основой которого бы послужили:

фиксация некоторых значений с временем жизни
реакция на истечение таймаута
Вы слышали о key-value хранилище, которое поддерживает хранение key-value значений и имеет механизм Pub/Sub. Что это за система? Какие минусы выбора данной системы?
>
> Судя по всему - это Redis.
>Минусы:  
> - для обслуживания нужны дорогостоящие знающие сотрудники, которых сложнее найти  
> - однопоточный, может масштабироваться только горизонтально посредством кластеризации

