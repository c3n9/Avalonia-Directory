using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using ChitChat.Models;
using System.Security.Cryptography;
using System;
using System.Linq;
using ChitChat.AppWindows;

namespace ChitChat.UserControls;

public partial class LoginUC : UserControl
{
    public LoginUC()
    {
        InitializeComponent();
    }

    private void ButtonOk_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        using(DBConnection db = new DBConnection())
        {
            SaveLoginAndPassword();
            var employee = db.Employee.FirstOrDefault(x => x.Username == TBUsername.Text && x.Password == GetHash(TBPassword.Text));
            if(employee == null)
            {
                MessageWindow messageWindow = new MessageWindow("Invalid login or password!");
                messageWindow.ShowDialog(App.MainWindow);
                return;
            }
            App.loginEmploee = employee;
            App.MainWindow.MainContentPresenter.Content = new MainUC();

        }
    }
    private string GetHash(string input)
    {
        var md5 = MD5.Create();
        var hash = md5.ComputeHash(System.Text.Encoding.UTF8.GetBytes(input));
        var text = Convert.ToBase64String(hash);
        return Convert.ToBase64String(hash);
    }
    private void ButtonCancel_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        App.MainWindow.Close();
    }

    private void ButtonRegistration_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        App.MainWindow.MainContentPresenter.Content = new RegistrationUC(new Employee());
    }
    private void SaveLoginAndPassword()
    {
        if (CBRememberMe.IsChecked.Value)
        {
            AdminPanel.Properties.Settings.Default.SaveLogin = true;
            AdminPanel.Properties.Settings.Default.Login = TBUsername.Text;
            AdminPanel.Properties.Settings.Default.Password = TBPassword.Text;
            AdminPanel.Properties.Settings.Default.Save();
        }
        else
        {
            AdminPanel.Properties.Settings.Default.SaveLogin = false;
            AdminPanel.Properties.Settings.Default.Login = string.Empty;
            AdminPanel.Properties.Settings.Default.Password = string.Empty;
            AdminPanel.Properties.Settings.Default.Save();
        }
    }

    private void UserControl_Loaded(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (AdminPanel.Properties.Settings.Default.SaveLogin)
        {
            TBUsername.Text = AdminPanel.Properties.Settings.Default.Login;
            TBPassword.Text = AdminPanel.Properties.Settings.Default.Password;
            CBRememberMe.IsChecked = AdminPanel.Properties.Settings.Default.SaveLogin;
        }
    }
}