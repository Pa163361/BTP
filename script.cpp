#include <bits/stdc++.h>
using namespace std;
int main()
{
    fstream file_names;
    // Enter text file which consists of file names of data
    file_names.open("file_names_HDB00_26_10_15.txt");
    // Enter folder name of your data
    string folder_name = "26_10_15_HDB00";
    string file_name;
    while (getline(file_names, file_name))
    {
        string new_csv_file = file_name + "_" + folder_name + ".csv";
        cout << new_csv_file << endl;
        string new_txt_file =
            file_name = file_name + ".txt";
        fstream file;
        fstream fin;
        fin.open(file_name);
        file.open(new_csv_file, ios::out | ios::trunc);
        string line;
        // string templatee = "Date,Time,N-S,E-W,U-D";
        int count = 0;
        int line_num = 6;
        while (getline(fin, line))
        {
            count++;
            if (line[0] != '#')
            {
                line_num = 2;
            }
            for (int i = 0; line[i] != '\0'; i++)
            {
                if ((int)line[i] == 9)
                {
                    if ((line[i + 1] != '\0') && (line[i + 1] != '\n'))
                        line[i] = ',';
                }
                if (line[i] == ' ')
                {
                    line[i] = ',';
                }
            }
            if (count >= line_num)
                file << line << endl;
        }
        fin.close();
        file.close();
    }
    return 0;
}