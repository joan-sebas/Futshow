using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// La plantilla de elemento Página en blanco está documentada en https://go.microsoft.com/fwlink/?LinkId=234238

namespace prjFutShow
{
    /// <summary>
    /// Una página vacía que se puede usar de forma independiente o a la que se puede navegar dentro de un objeto Frame.
    /// </summary>
    public sealed partial class frmInicio : Page
    {
        public frmInicio()
        {
            this.InitializeComponent();
            ContentFrame.Navigate(typeof(MainPage));
        }
        private void HamburguerButton_Click(object sender, RoutedEventArgs e)
        {
            if (Split.IsPaneOpen)
            {
                Split.IsPaneOpen = false;
            }
            else
            {
                Split.IsPaneOpen = true;
            }
            HamburguerButton.IsChecked = false;
        }
        private void GoBack_Click(object sender, RoutedEventArgs e)
        {
            if (ContentFrame.CanGoBack)
            {
                ContentFrame.GoBack();
            }

        }
        private void Home_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.Navigate(typeof(MainPage));
            Home.IsChecked = true;

        }
        private void RadioButton_Click(object sender, RoutedEventArgs e)
        {

            ContentFrame.Navigate(typeof(frmAdminCancha));
            Pagina1.IsChecked = true;
        }
        private void RadioButton_Click_1(object sender, RoutedEventArgs e)
        {

            ContentFrame.Navigate(typeof(frmManejoPartidos));
            Pagina2.IsChecked = true;
        }
        private void RadioButton_Click_2(object sender, RoutedEventArgs e)
        {

            ContentFrame.Navigate(typeof(frmManejoPartidos));
            Pagina3.IsChecked = true;
        }
    }
}
