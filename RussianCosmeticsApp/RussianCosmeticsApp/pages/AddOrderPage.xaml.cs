using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
using RussianCosmeticsApp.model;

namespace RussianCosmeticsApp.pages
{
    /// <summary>
    /// Логика взаимодействия для AddOrderPage.xaml
    /// </summary>
    public partial class AddOrderPage : Page
    {
        private int clientId = 0;
        private Order _currentOrder = new Order();
        public AddOrderPage(Order order)
        {
            InitializeComponent();
            if (order != null) { _currentOrder = order; }
            DataContext = _currentOrder;
            cmbServices.ItemsSource = RussianCosmeticsEntities.GetContext().Service.ToList();
            cmbStatusOrder.DataContext = this;
            cmbStatusService.DataContext = this;
            dg_Clients.ItemsSource = RussianCosmeticsEntities.GetContext().Clients.ToList();
        }

        public string[] SortingList { get; set; } =
        {
            "Выполнено",
            "Не выполнено"
        };

        private void txtTimeComplete_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9.-]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                _currentOrder.DateCreate = (DateTime)dpCreateDate.SelectedDate;
                _currentOrder.ID_Service = cmbServices.SelectedIndex + 1;
                var existingOrderIds = RussianCosmeticsEntities.GetContext().Order.Select(o => o.ID_Order).ToList();

                _currentOrder.StatusService = cmbStatusService.SelectedItem.ToString();
                _currentOrder.StatusOrder = cmbStatusOrder.SelectedItem.ToString();

                _currentOrder.ID_Client = Convert.ToInt32(txtIDClient.Text);

                if (existingOrderIds.Contains(_currentOrder.ID_Order))
                {
                    RussianCosmeticsEntities.GetContext().SaveChanges();
                    MessageBox.Show("Изменено");
                }
                else
                {
                    RussianCosmeticsEntities.GetContext().Order.Add(_currentOrder);
                    RussianCosmeticsEntities.GetContext().SaveChanges();
                    MessageBox.Show("Добавлено");
                }
                NavigationService.GoBack();
            }
            catch(Exception ex) { MessageBox.Show(ex.Message); }
        }

        private void RadioButton_Click(object sender, RoutedEventArgs e)
        {
            RadioButton clickedRadioButton = sender as RadioButton;
            if (clickedRadioButton != null)
            {
                if (clickedRadioButton.IsChecked == true)
                {
                    Clients client = clickedRadioButton.DataContext as Clients;
                    if (client != null)
                    {

                        clientId = client.ID_Clients;

                        dg_Clients.Items.Refresh();
                    }
                }
            }
        }
    }
}
