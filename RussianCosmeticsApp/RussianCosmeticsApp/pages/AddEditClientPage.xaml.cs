using RussianCosmeticsApp.model;
using System;
using System.Collections.Generic;
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
using System.Xml.Linq;

namespace RussianCosmeticsApp.pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditClientPage.xaml
    /// </summary>
    public partial class AddEditClientPage : Page
    {
        private Clients _currentClient = new Clients();
        public AddEditClientPage(Clients client, string selectedValue)
        {
            InitializeComponent();
            if (client != null) { _currentClient = client; }
            DataContext = _currentClient;
            if(selectedValue == "Юр. лицо")
            {
                tb_EmailPhysic.IsReadOnly = true;
                tb_FIOPhysic.IsReadOnly = true;
                tb_SeriaPassportPhysic.IsReadOnly = true;
                tb_PhonePhysic.IsReadOnly = true;
                tb_PasswordPhysic.IsReadOnly = true;
                //tb_BIK.Visibility = Visibility.Collapsed;
            }
            else
            if(selectedValue == "Физ. лицо")
            {
                tb_Name.IsReadOnly = true;
                tb_INN.IsReadOnly = true;
                tb_Addres.IsReadOnly = true;
                tb_Payment.IsReadOnly = true;
                tb_BIK.IsReadOnly = true;
                tb_FIOHead.IsReadOnly = true;
                tb_FIOContact.IsReadOnly = true;
                tb_PhoneContact.IsReadOnly = true;
                tb_EmailPhysic.IsReadOnly = true;

            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var errors = new StringBuilder();

                if (tb_DateBirthPhysic.SelectedDate == null) errors.AppendLine("Не выбрана дата");

                //if (String.IsNullOrEmpty(tb_Name.Text)) errors.AppendLine("Введите все значения");
                if (string.IsNullOrEmpty(tb_Name.Text) || string.IsNullOrEmpty(tb_ID.Text))
                {
                    errors.AppendLine("Введите все значения");
                }


                if (!ValidateFIO(tb_FIOHead.Text)) { errors.AppendLine("Неправильно введено ФИО"); }
                //if (!ValidateFIO(tb_FIOPhysic.Text)) { errors.AppendLine("Неправильно введено ФИО"); }
                if(errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString());
                    return;
                }

                _currentClient.DateBirthPhysical = (DateTime)tb_DateBirthPhysic.SelectedDate;
                var existingClientIds = RussianCosmeticsEntities.GetContext().Clients.Select(o => o.ID_Clients).ToList();
                _currentClient.ID_Clients = Convert.ToInt32(tb_ID.Text);

                if (existingClientIds.Contains(_currentClient.ID_Clients))
                {
                    RussianCosmeticsEntities.GetContext().SaveChanges();
                    MessageBox.Show("Изменено");
                }
                else
                {
                    RussianCosmeticsEntities.GetContext().Clients.Add(_currentClient);
                    RussianCosmeticsEntities.GetContext().SaveChanges();
                    MessageBox.Show("Добавлено");
                }
                NavigationService.GoBack();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }
        private bool ValidateFIO(string s)
        {
            Regex regex = new Regex("[^a-zа-я -]+");
            return regex.IsMatch(s);
        }
    }
}
