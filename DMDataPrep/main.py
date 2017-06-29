import csv
import datetime
import json
from os import listdir
from os.path import isfile, join
from statistics import mean, median

import h5py
import numpy as np


def import_ubuntu_firebase():
    with open('/home/epezhman/exports/tum-dm-fireb_data.json') as data_file:
        data = json.load(data_file)
        with open('/home/epezhman/exports/dm_logs_my_ubuntu.csv', 'w') as csvfile:
            writer = csv.DictWriter(csvfile,
                                    fieldnames=["ac_connected_bool", "brightness_percent", "charging_bool", "cpu_cores",
                                                "cpu_usage_percent", "discharging_bool",
                                                "dm_enabled", "download_kb", "internet_connected", "memory_mb",
                                                "memory_percent", "power_rate_w", "read_kb_per_s", "read_request_per_s",
                                                "remaining_capacity_percent", "remaining_time_minutes", "time",
                                                "upload_kb", "voltage_v", "wifi", "write_kb_per_s",
                                                "write_request_per_s", ],
                                    delimiter=',')
            writer.writeheader()
            for _id, val in data['logging']['f4c65d10-25d2-11e7-81c6-5d3fcec29a5f'].items():
                writer.writerow({'ac_connected_bool': val['ac_connected_bool'],
                                 'brightness_percent': val['brightness_percent'],
                                 'charging_bool': val['charging_bool'],
                                 'cpu_cores': val['cpu_cores'],
                                 'cpu_usage_percent': val['cpu_usage_percent'],
                                 'discharging_bool': val['discharging_bool'],
                                 'dm_enabled': val['dm_enabled'],
                                 'download_kb': val['download_kb'],
                                 'internet_connected': val['internet_connected'],
                                 'memory_mb': val['memory_mb'],
                                 'memory_percent': val['memory_percent'],
                                 'power_rate_w': val['power_rate_w'],
                                 'read_kb_per_s': val['read_kb_per_s'],
                                 'read_request_per_s': val['read_request_per_s'],
                                 'remaining_capacity_percent': val['remaining_capacity_percent'],
                                 'remaining_time_minutes': val['remaining_time_minutes'],
                                 'time': val['time'],
                                 'upload_kb': val['upload_kb'],
                                 'voltage_v': val['voltage_v'],
                                 'wifi': val['wifi'],
                                 'write_kb_per_s': val['write_kb_per_s'],
                                 'write_request_per_s': val['write_request_per_s'], })


def import_windows_firebase():
    with open('/home/epezhman/exports/tum-dm-fireb_data.json') as data_file:
        data = json.load(data_file)
        with open('/home/epezhman/exports/dm_logs_my_windows.csv', 'w') as csvfile:
            writer = csv.DictWriter(csvfile,
                                    fieldnames=["ac_connected_bool", "brightness_percent", "charging_bool", "cpu_cores",
                                                "cpu_usage_percent", "discharging_bool",
                                                "dm_enabled", "download_kb", "internet_connected", "memory_mb",
                                                "memory_percent", "power_rate_w", "read_kb_per_s", "read_request_per_s",
                                                "remaining_capacity_percent", "remaining_time_minutes", "time",
                                                "upload_kb", "voltage_v", "wifi", "write_kb_per_s",
                                                "write_request_per_s", ],
                                    delimiter=',')
            writer.writeheader()
            for _id, val in data['logging']['ed830f50-25e4-11e7-95b2-932742135332'].items():
                writer.writerow({'ac_connected_bool': val['ac_connected_bool'],
                                 'brightness_percent': val['brightness_percent'],
                                 'charging_bool': val['charging_bool'],
                                 'cpu_cores': val['cpu_cores'],
                                 'cpu_usage_percent': val['cpu_usage_percent'],
                                 'discharging_bool': val['discharging_bool'],
                                 'dm_enabled': val['dm_enabled'],
                                 'download_kb': val['download_kb'],
                                 'internet_connected': val['internet_connected'],
                                 'memory_mb': val['memory_mb'],
                                 'memory_percent': val['memory_percent'],
                                 'power_rate_w': val['power_rate_w'],
                                 'read_kb_per_s': val['read_kb_per_s'],
                                 'read_request_per_s': val['read_request_per_s'],
                                 'remaining_capacity_percent': val['remaining_capacity_percent'],
                                 'remaining_time_minutes': val['remaining_time_minutes'],
                                 'time': val['time'],
                                 'upload_kb': val['upload_kb'],
                                 'voltage_v': val['voltage_v'],
                                 'wifi': val['wifi'],
                                 'write_kb_per_s': val['write_kb_per_s'],
                                 'write_request_per_s': val['write_request_per_s'], })


def import_hdf5():
    hdfiles = [f for f in listdir('/home/epezhman/exports/hdf5') if isfile(join('/home/epezhman/exports/hdf5', f))]
    with open('/home/epezhman/exports/dm_logs_nofare_my_ubuntu.csv', 'w') as csvfile:
        writer = csv.DictWriter(csvfile,
                                fieldnames=["apparent_power", "current_rms", "power_factor", "real_power", "time"],
                                delimiter=',')
        writer.writeheader()
        for hdfile in hdfiles:
            with h5py.File('/home/epezhman/exports/hdf5/' + hdfile) as hdf:
                year = hdf.attrs['year']
                month = hdf.attrs['month']
                day = hdf.attrs['day']
                start_seconds = hdf.attrs['start_seconds']
                start_time = datetime.datetime(year, month, day, 0, start_seconds // 60, start_seconds % 60)

                app1 = np.array(hdf.get('apparent_power1'))
                app2 = np.array(hdf.get('apparent_power2'))
                app3 = np.array(hdf.get('apparent_power3'))
                app4 = np.array(hdf.get('apparent_power4'))
                app5 = np.array(hdf.get('apparent_power5'))
                app6 = np.array(hdf.get('apparent_power6'))

                curr1 = np.array(hdf.get('current_rms1'))
                curr2 = np.array(hdf.get('current_rms2'))
                curr3 = np.array(hdf.get('current_rms3'))
                curr4 = np.array(hdf.get('current_rms4'))
                curr5 = np.array(hdf.get('current_rms5'))
                curr6 = np.array(hdf.get('current_rms6'))

                fac1 = np.array(hdf.get('power_factor1'))
                fac2 = np.array(hdf.get('power_factor2'))
                fac3 = np.array(hdf.get('power_factor3'))
                fac4 = np.array(hdf.get('power_factor4'))
                fac5 = np.array(hdf.get('power_factor5'))
                fac6 = np.array(hdf.get('power_factor6'))

                real1 = np.array(hdf.get('real_power1'))
                real2 = np.array(hdf.get('real_power2'))
                real3 = np.array(hdf.get('real_power3'))
                real4 = np.array(hdf.get('real_power4'))
                real5 = np.array(hdf.get('real_power5'))
                real6 = np.array(hdf.get('real_power6'))

                voltage_rms = np.array(hdf.get('voltage_rms'))
                mains_frequency = np.array(hdf.get('mains_frequency'))

                if not (len(app1) == len(curr1) == len(fac1) == len(real1)):
                    raise Exception('1 not equal count')
                if not (len(app2) == len(curr2) == len(fac2) == len(real2)):
                    raise Exception('2 not equal count')
                if not (len(app3) == len(curr3) == len(fac3) == len(real3)):
                    raise Exception('3 not equal count')
                if not (len(app4) == len(curr4) == len(fac4) == len(real4)):
                    raise Exception('4 not equal count')
                if not (len(app5) == len(curr5) == len(fac5) == len(real5)):
                    raise Exception('5 not equal count')
                if not (len(app6) == len(curr6) == len(fac6) == len(real6)):
                    raise Exception('6 not equal count')

                for idx, val in enumerate(app1):
                    writer.writerow({'apparent_power': app1[idx],
                                     'current_rms': curr1[idx],
                                     'power_factor': fac1[idx],
                                     'real_power': real1[idx],
                                     'time': str(start_time)})
                    start_time = start_time + datetime.timedelta(seconds=1)

                    # for idx, val in enumerate(app2):
                    #     writer.writerow({'apparent_power': app2[idx],
                    #                      'current_rms': curr2[idx],
                    #                      'power_factor': fac2[idx],
                    #                      'real_power': real2[idx],
                    #                      'time': str(start_time)})
                    #     start_time = start_time + datetime.timedelta(seconds=1)
                    #
                    # for idx, val in enumerate(app2):
                    #     writer.writerow({'apparent_power': app3[idx],
                    #                      'current_rms': curr3[idx],
                    #                      'power_factor': fac3[idx],
                    #                      'real_power': real3[idx],
                    #                      'time': str(start_time)})
                    #     start_time = start_time + datetime.timedelta(seconds=1)
                    #
                    # for idx, val in enumerate(app4):
                    #     writer.writerow({'apparent_power': app4[idx],
                    #                      'current_rms': curr4[idx],
                    #                      'power_factor': fac4[idx],
                    #                      'real_power': real4[idx],
                    #                      'time': str(start_time)})
                    #     start_time = start_time + datetime.timedelta(seconds=1)
                    #
                    # for idx, val in enumerate(app5):
                    #     writer.writerow({'apparent_power': app5[idx],
                    #                      'current_rms': curr5[idx],
                    #                      'power_factor': fac5[idx],
                    #                      'real_power': real5[idx],
                    #                      'time': str(start_time)})
                    #     start_time = start_time + datetime.timedelta(seconds=1)
                    #
                    # for idx, val in enumerate(app6):
                    #     writer.writerow({'apparent_power': app6[idx],
                    #                      'current_rms': curr6[idx],
                    #                      'power_factor': fac6[idx],
                    #                      'real_power': real6[idx],
                    #                      'time': str(start_time)})
                    #     start_time = start_time + datetime.timedelta(seconds=1)


def get_experiment_data():
    with open('/home/epezhman/exports/experiment_data/nejc_laptop.csv', 'w') as csvfile:
        writer = csv.DictWriter(csvfile,
                                fieldnames=["apparent_power", "current_rms", "power_factor", "real_power", "time"],
                                delimiter=',')
        writer.writeheader()
        with h5py.File('/home/epezhman/exports/experiment/Nejc/medal-15-2017-06-21.hdf5') as hdf:
            year = hdf.attrs['year']
            month = hdf.attrs['month']
            day = hdf.attrs['day']
            start_seconds = hdf.attrs['delay_after_midnight']
            start_time = datetime.datetime(year, month, day, 0, start_seconds // 60, start_seconds % 60)

            app1 = np.array(hdf.get('apparent_power1'))
            app2 = np.array(hdf.get('apparent_power2'))
            app3 = np.array(hdf.get('apparent_power3'))
            app4 = np.array(hdf.get('apparent_power4'))
            app5 = np.array(hdf.get('apparent_power5'))
            app6 = np.array(hdf.get('apparent_power6'))

            curr1 = np.array(hdf.get('current_rms1'))
            curr2 = np.array(hdf.get('current_rms2'))
            curr3 = np.array(hdf.get('current_rms3'))
            curr4 = np.array(hdf.get('current_rms4'))
            curr5 = np.array(hdf.get('current_rms5'))
            curr6 = np.array(hdf.get('current_rms6'))

            fac1 = np.array(hdf.get('power_factor1'))
            fac2 = np.array(hdf.get('power_factor2'))
            fac3 = np.array(hdf.get('power_factor3'))
            fac4 = np.array(hdf.get('power_factor4'))
            fac5 = np.array(hdf.get('power_factor5'))
            fac6 = np.array(hdf.get('power_factor6'))

            real1 = np.array(hdf.get('real_power1'))
            real2 = np.array(hdf.get('real_power2'))
            real3 = np.array(hdf.get('real_power3'))
            real4 = np.array(hdf.get('real_power4'))
            real5 = np.array(hdf.get('real_power5'))
            real6 = np.array(hdf.get('real_power6'))

            voltage_rms = np.array(hdf.get('voltage_rms'))
            mains_frequency = np.array(hdf.get('mains_frequency'))

            if not (len(app1) == len(curr1) == len(fac1) == len(real1)):
                raise Exception('1 not equal count')
            if not (len(app2) == len(curr2) == len(fac2) == len(real2)):
                raise Exception('2 not equal count')
            if not (len(app3) == len(curr3) == len(fac3) == len(real3)):
                raise Exception('3 not equal count')
            if not (len(app4) == len(curr4) == len(fac4) == len(real4)):
                raise Exception('4 not equal count')
            if not (len(app5) == len(curr5) == len(fac5) == len(real5)):
                raise Exception('5 not equal count')
            if not (len(app6) == len(curr6) == len(fac6) == len(real6)):
                raise Exception('6 not equal count')

                # for idx, val in enumerate(app1):
                #     writer.writerow({'apparent_power': app1[idx],
                #                      'current_rms': curr1[idx],
                #                      'power_factor': fac1[idx],
                #                      'real_power': real1[idx],
                #                      'time': str(start_time)})
                #     start_time = start_time + datetime.timedelta(seconds=1)
                # #
                # for idx, val in enumerate(app2):
                #     writer.writerow({'apparent_power': app2[idx],
                #                      'current_rms': curr2[idx],
                #                      'power_factor': fac2[idx],
                #                      'real_power': real2[idx],
                #                      'time': str(start_time)})
                #     start_time = start_time + datetime.timedelta(seconds=1)
                #
                # for idx, val in enumerate(app2):
                #     writer.writerow({'apparent_power': app3[idx],
                #                      'current_rms': curr3[idx],
                #                      'power_factor': fac3[idx],
                #                      'real_power': real3[idx],
                #                      'time': str(start_time)})
                #     start_time = start_time + datetime.timedelta(seconds=1)
                #
                # for idx, val in enumerate(app4):
                #     writer.writerow({'apparent_power': app4[idx],
                #                      'current_rms': curr4[idx],
                #                      'power_factor': fac4[idx],
                #                      'real_power': real4[idx],
                #                      'time': str(start_time)})
                #     start_time = start_time + datetime.timedelta(seconds=1)
                #
                # for idx, val in enumerate(app5):
                #     writer.writerow({'apparent_power': app5[idx],
                #                      'current_rms': curr5[idx],
                #                      'power_factor': fac5[idx],
                #                      'real_power': real5[idx],
                #                      'time': str(start_time)})
                #     start_time = start_time + datetime.timedelta(seconds=1)

                # for idx, val in enumerate(app6):
                #     writer.writerow({'apparent_power': app6[idx],
                #                      'current_rms': curr6[idx],
                #                      'power_factor': fac6[idx],
                #                      'real_power': real6[idx],
                #                      'time': str(start_time)})
                #     start_time = start_time + datetime.timedelta(seconds=1)


def get_experiment_data_firebase():
    with open('/home/epezhman/exports/tum-dm-fireb_data_27_06.json') as data_file:
        data = json.load(data_file)
        ex_ids = []
        experiments = dict()
        for _id, val in data['experiment'].items():
            if val['experiment-id'] not in ex_ids:
                ex_ids.append(val['experiment-id'])
                experiments[val['experiment-id']] = {
                    'selected-laptop': []
                }


        for _id, val in data['experiment'].items():
            if 'experiment_status' in val:
                if val['time-db'] not in [1498050973056, 1498047053057, 1498046308989, 1498050075268]:
                    experiments[val['experiment-id']][val['experiment_status']] = val['time-mo']
                    experiments[val['experiment-id']][val['experiment_status'] + '_time_db'] = int(val['time-db'])

            if 'demand-cut' in val:
                experiments[val['experiment-id']]['demand-cut'] = val['demand-cut']
            if 'selected-laptop' in val:
                if val['selected-laptop'] not in experiments[val['experiment-id']]['selected-laptop']:
                    experiments[val['experiment-id']]['selected-laptop'].append(val['selected-laptop'])

        with open('/home/epezhman/exports/experiment_data/experiments.csv', 'w') as csvfile:
            writer = csv.DictWriter(csvfile,
                                    fieldnames=["start", "demand_cut", "finish_scheduling", "all_joined",
                                                "count_laptops", "diff_time_start_finish_scheduling",
                                                "diff_time_finish_scheduling_all_joined", "diff_time_total"],
                                    delimiter=',')
            writer.writeheader()
            for key, value in experiments.items():
                temp_row = {'start': value['start'],
                            'demand_cut': value['demand-cut'],
                            'finish_scheduling': value[
                                'finish-scheduling'] if 'finish-scheduling' in value else "0",
                            'all_joined': value['all-joined'] if 'all-joined' in value else "0",
                            'count_laptops': len(value['selected-laptop'])}

                if temp_row['finish_scheduling'] != "0" and temp_row['all_joined'] != "0":
                    temp_row['diff_time_start_finish_scheduling'] = value['finish-scheduling_time_db'] - value[
                        'start_time_db']
                    temp_row['diff_time_finish_scheduling_all_joined'] = value['all-joined_time_db'] - value[
                        'finish-scheduling_time_db']
                    temp_row['diff_time_total'] = value['all-joined_time_db'] - value['start_time_db']

                    writer.writerow(temp_row)
                else:
                    temp_row['diff_time_start_finish_scheduling'] = 0
                    temp_row['diff_time_finish_scheduling_all_joined'] = 0
                    temp_row['diff_time_total'] = 0



def normalize_experiment_data():
    logs = {}
    with open('/home/epezhman/exports/experiment_data/merged_experiments.csv', 'r') as csvfile:
        reader = csv.reader(csvfile)
        headers = next(reader)[1:]
        for row in reader:
            key_time = datetime.datetime.strptime(row[0], "%Y-%m-%d %H:%M:%S")
            logs[key_time] = {key: float(value) for key, value in zip(headers, row[1:])}
            logs[key_time]['time'] = key_time

    start_time = datetime.datetime.strptime("2017-06-21 12:00:01", "%Y-%m-%d %H:%M:%S")
    with open('/home/epezhman/exports/experiment_data/experiments_compressed.csv', 'w') as csvfile:
        writer = csv.DictWriter(csvfile,
                                fieldnames=["time",
                                            "pow.pezh.lp.mean",
                                            "pow.pezh.lp.median",
                                            "pow.jose.lp.mean",
                                            "pow.jose.lp.median",
                                            "pow.jose.lcd1.mean",
                                            "pow.jose.lcd1.median",
                                            "pow.jose.lcd2.mean",
                                            "pow.jose.lcd2.median",
                                            "pow.mr.lp.mean",
                                            "pow.mr.lp.median",
                                            "pow.mr.lcd1.mean",
                                            "pow.mr.lcd1.median",
                                            "pow.mr.lcd2.mean",
                                            "pow.mr.lcd2.median",
                                            "pow.nejc.lp.mean",
                                            "pow.nejc.lp.median",
                                            "pow.nejc.lcd.mean",
                                            "pow.nejc.lcd.median",
                                            "pezh.jose.mean",
                                            "pezh.jose.median",
                                            "pezh.jose.mr.mean",
                                            "pezh.jose.mr.median",
                                            "pezh.jose.mr.nejc.mean",
                                            "pezh.jose.mr.nejc.median",
                                            "pezh.jose.lcd.mean",
                                            "pezh.jose.lcd.median",
                                            "pezh.jose.mr.lcd.mean",
                                            "pezh.jose.mr.lcd.median",
                                            "pezh.jose.mr.nejc.lcd.mean",
                                            "pezh.jose.mr.nejc.lcd.median"],
                                delimiter=',')
        writer.writeheader()
        for i in range(1440):
            pezh_l = []
            jose_l = []
            jose_c_1 = []
            jose_c_2 = []
            mr_l = []
            mr_s_1 = []
            mr_s_2 = []
            nejc_l = []
            nejc_s = []

            p_j = []
            p_j_m = []
            p_j_m_n = []

            p_j_s = []
            p_j_m_s = []
            p_j_m_n_s = []

            temp_row = {}

            for j in range(10):
                start_time += datetime.timedelta(0, 1)
                if start_time in logs.keys():
                    temp_row['time'] = str(start_time)
                    pezh_l.append(logs[start_time]['pow.pezh.lp'])
                    jose_l.append(logs[start_time]['pow.jose.lp'])
                    jose_c_1.append(logs[start_time]['pow.jose.lcd1'])
                    jose_c_2.append(logs[start_time]['pow.jose.lcd2'])
                    mr_l.append(logs[start_time]['pow.mr.lp'])
                    mr_s_1.append(logs[start_time]['pow.mr.lcd1'])
                    mr_s_2.append(logs[start_time]['pow.mr.lcd2'])
                    nejc_l.append(logs[start_time]['pow.nejc.lp'])
                    nejc_s.append(logs[start_time]['pow.nejc.lcd'])

                    p_j.append(logs[start_time]['pezh.jose'])
                    p_j_m.append(logs[start_time]['pezh.jose.mr'])
                    p_j_m_n.append(logs[start_time]['pezh.jose.mr.nejc'])

                    p_j_s.append(logs[start_time]['pezh.jose.lcd'])
                    p_j_m_s.append(logs[start_time]['pezh.jose.mr.lcd'])
                    p_j_m_n_s.append(logs[start_time]['pezh.jose.mr.nejc.lcd'])

            temp_row['pow.pezh.lp.mean'] = mean(pezh_l)
            temp_row['pow.pezh.lp.median'] = median(pezh_l)

            temp_row['pow.jose.lp.mean'] = mean(jose_l)
            temp_row['pow.jose.lp.median'] = median(jose_l)

            temp_row['pow.jose.lcd1.mean'] = mean(jose_c_1)
            temp_row['pow.jose.lcd1.median'] = median(jose_c_1)

            temp_row['pow.jose.lcd2.mean'] = mean(jose_c_2)
            temp_row['pow.jose.lcd2.median'] = median(jose_c_2)

            temp_row['pow.mr.lp.mean'] = mean(mr_l)
            temp_row['pow.mr.lp.median'] = median(mr_l)

            temp_row['pow.mr.lcd1.mean'] = mean(mr_s_1)
            temp_row['pow.mr.lcd1.median'] = median(mr_s_1)

            temp_row['pow.mr.lcd2.mean'] = mean(mr_s_2)
            temp_row['pow.mr.lcd2.median'] = median(mr_s_2)

            temp_row['pow.nejc.lp.mean'] = mean(nejc_l)
            temp_row['pow.nejc.lp.median'] = median(nejc_l)

            temp_row['pow.nejc.lcd.mean'] = mean(nejc_s)
            temp_row['pow.nejc.lcd.median'] = median(nejc_s)

            temp_row['pezh.jose.mean'] = mean(p_j)
            temp_row['pezh.jose.median'] = median(p_j)

            temp_row['pezh.jose.mr.mean'] = mean(p_j_m)
            temp_row['pezh.jose.mr.median'] = median(p_j_m)

            temp_row['pezh.jose.mr.nejc.mean'] = mean(p_j_m_n)
            temp_row['pezh.jose.mr.nejc.median'] = median(p_j_m_n)

            temp_row['pezh.jose.lcd.mean'] = mean(p_j_s)
            temp_row['pezh.jose.lcd.median'] = median(p_j_s)

            temp_row['pezh.jose.mr.lcd.mean'] = mean(p_j_m_s)
            temp_row['pezh.jose.mr.lcd.median'] = median(p_j_m_s)

            temp_row['pezh.jose.mr.nejc.lcd.mean'] = mean(p_j_m_n_s)
            temp_row['pezh.jose.mr.nejc.lcd.median'] = median(p_j_m_n_s)

            writer.writerow(temp_row)


    print(len(logs))


if __name__ == '__main__':
    # import_ubuntu_firebase()
    # import_hdf5()
    # import_windows_firebase()
    # get_experiment_data_firebase()
    # get_experiment_data()
    normalize_experiment_data()


# {'pezh.jose.mr': 87.5283, 'pezh.jose.mr.nejc.lcd': 163.4434, 'pow.mr.lcd2':
# 1.42095, 'pow.jose.lp': 24.0969, 'pow.nejc.lp': 32.0155, 'pow.nejc.lcd': 43.8996, 'pow.jose.lcd1':
# 115.96, 'pezh.jose': 47.4235, 'pow.pezh.lp': 23.3266, 'time': datetime.datetime(2017, 6, 21, 15, 59, 59),
# 'pow.mr.lcd1': 3.72654, 'pow.jose.lcd2': 59.4318, 'pezh.jose.mr.lcd': 92.67579, 'pow.mr.lp': 40.1048,
# 'pezh.jose.mr.nejc': 119.5438, 'pezh.jose.lcd': 222.8153}
