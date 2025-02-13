//
//  bio.swift
//  PersonalProfileApp
//
//  Created by yunus on 09.02.2025.
//
import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    
                    ProjectView(nameProject: "MathBuster", backColor: .blue, destination: DetailView(title: "MathBuster", videoName: "MathBuster", videoFormat: "MP4", description: """
MathBuster – это сетевая математическая мини-игра, в которой пользователи решают арифметические задачи на время. Проект использует Firebase для аутентификации пользователей (FirebaseAuth) и Firestore для хранения результатов.

Функциональность:
    •    Авторизация: регистрация и вход через FirebaseAuth.
    •    Игровой процесс: генерация арифметических примеров с ограничением по времени.
    •    Сохранение результатов: набранные баллы отправляются в Firestore.
    •    Рейтинг игроков: отображение лучших результатов в отдельном экране с данными из Firestore.

Используемые технологии:
    •    Swift, UIKit
    •    Firebase (Auth, Firestore)

Проект ориентирован на простую механику с интеграцией сетевых сервисов для хранения и сравнения результатов пользователей.
"""))
                    ProjectView(nameProject: "IContact", backColor: .red, destination: DetailView(title: "IContact", videoName: "IContact", videoFormat: "MP4", description: """
iContact — это приложение для управления контактами, аналог стандартного iOS-приложения “Контакты”. Проект использует CoreData для хранения данных, а интерфейс построен на UITableView с заголовками для удобной группировки контактов.

Функциональность:
    •    Добавление контактов: возможность создать новый контакт с именем, фамилией, номером телефона и другой информацией.
    •    Редактирование и обновление: изменение данных существующего контакта.
    •    Сортировка: контакты группируются по первым буквам имени и могут быть отсортированы по First Name или Last Name.
    •    Звонки и сообщения: встроенные функции для вызова и отправки сообщений прямо из приложения.

Используемые технологии:
    •    Swift, UIKit
    •    CoreData (локальное хранилище контактов)
    •    UITableView (группированный список контактов с секциями)
    •    MessageUI (инициализация сообщений)

Проект ориентирован на удобное управление контактами с локальным хранением и базовыми функциями связи.
"""))
                    ProjectView(nameProject: "ImageSearch", backColor: .yellow, destination: DetailView(title: "ImageSearch", videoName: "ImageSearch", videoFormat: "MP4", description: """
ImageSearch — это приложение для поиска изображений, где основная галерея реализована через UICollectionView, а история поиска — через SwiftUI LazyHGrid.

Технологии и основные функции:
    •    Alamofire – для выполнения сетевых запросов к API изображений.
    •    SDWebImage – для загрузки и кэширования изображений в коллекции.
    •    UIKit – используется для отображения найденных изображений через UICollectionView.
    •    SwiftUI – используется для отображения истории поиска через LazyHGrid.
    •    CoreData - используется для хранения история поиска.

Как работает приложение:
    1.    Пользователь вводит поисковый запрос.
    2.    Alamofire отправляет HTTP-запрос и получает изображения.
    3.    Посковый запрос сохраняется в базе данных CoreData
    4.    UICollectionView (UIKit) отображает найденные изображения в сетке.
    5.    История поиска отображается через LazyHGrid (SwiftUI) через UIHostingViewController.

"""))
                }
            }
            .navigationTitle("My Project")
            .foregroundStyle(.white)
            .background(Color.black)
        }
    }
}

struct ProjectView<Destination: View>: View {
    let nameProject: String
    let backColor: Color
    let destination: Destination
    
    var body: some View {
        HStack {
            Text(nameProject)
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(.leading, 40)
            
            Spacer()
            NavigationLink(destination: destination) {
                Text("Go")
                    .foregroundStyle(.white)
                    .frame(minWidth: 100, maxHeight: .infinity)
                    .background(Color.gray)
                    .cornerRadius(15)
                    .padding(.vertical, 15)
                    .padding(.trailing, 20)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 400)
        .background(backColor)
        .cornerRadius(30)
        .padding(.horizontal, 10)
    }
}

#Preview{
    ContentView()
}
