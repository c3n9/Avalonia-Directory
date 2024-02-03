﻿using System;
using System.Collections.ObjectModel;
using System.Linq;
using AvaloniaCRUD.Models;
using ReactiveUI;

namespace AvaloniaCRUD.ViewModels;

public class UserViewModel : ReactiveObject
{
    private User _user;

    public User User
    {
        get => _user;
        set => this.RaiseAndSetIfChanged(ref _user, value);
    }

    public ObservableCollection<User> Users { get; set; } = new ObservableCollection<User>();

    public UserViewModel()
    {
        LoadUsers();
    }

    private void LoadUsers()
    {
        try
        {
            using (var context = new DBConnection())
            {
                Users.Clear();
                var users = context.User.ToList();
                foreach (var user in users)
                {
                    Users.Add(user);
                }
            }
        }
        catch(Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }
}