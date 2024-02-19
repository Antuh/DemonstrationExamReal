using RussianCosmeticsApp.model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using RussianCosmeticsApp.pages;

namespace RussianCosmeticsApp.pages
{
    /// <summary>
    /// Логика взаимодействия для OrderPage.xaml
    /// </summary>
    public partial class OrderPage : Page
    {
        public OrderPage()
        {
            InitializeComponent();
            dg_Orders.ItemsSource = RussianCosmeticsEntities.GetContext().Order.ToList();
        }

        private void btAddOrder_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddOrderPage(null));
        }

        private void btChange_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddOrderPage(dg_Orders.SelectedItem as Order));
        }

        private void btUpdateOrder_Click(object sender, RoutedEventArgs e)
        {
            dg_Orders.ItemsSource = RussianCosmeticsEntities.GetContext().Order.ToList();
        }
    }
}
