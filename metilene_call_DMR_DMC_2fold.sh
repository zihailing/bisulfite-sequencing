#!/bin/sh
~/tools/metilene_v0.2-7/metilene -t 20 -M 100  -a  mock_Col.0 -b mock_ddm1   metilene_DMC_input/metilene_DMC_mock_Col-0_ddm1_filtered.input >metilene_DMC_DMR_filtered/metilene_DMC_mock_Col-0_ddm1.DMR
~/tools/metilene_v0.2-7/metilene -t 20 -M 100  -a  mock_Col.0 -b mock_ibm1.1   metilene_DMC_input/metilene_DMC_mock_Col-0_ibm1-1_filtered.input >metilene_DMC_DMR_filtered/metilene_DMC_mock_Col-0_ibm1-1.DMR
~/tools/metilene_v0.2-7/metilene -t 20 -M 100  -a  mock_Col.0 -b mock_rdd2   metilene_DMC_input/metilene_DMC_mock_Col-0_rdd2_filtered.input >metilene_DMC_DMR_filtered/metilene_DMC_mock_Col-0_rdd2.DMR
~/tools/metilene_v0.2-7/metilene -t 20 -M 100  -a  treat_Col.0 -b treat_ddm1   metilene_DMC_input/metilene_DMC_treat_Col-0_ddm1_filtered.input >metilene_DMC_DMR_filtered/metilene_DMC_treat_Col-0_ddm1.DMR
~/tools/metilene_v0.2-7/metilene -t 20 -M 100  -a  treat_Col.0 -b treat_ibm1.1   metilene_DMC_input/metilene_DMC_treat_Col-0_ibm1-1_filtered.input >metilene_DMC_DMR_filtered/metilene_DMC_treat_Col-0_ibm1-1.DMR
~/tools/metilene_v0.2-7/metilene -t 20 -M 100  -a  treat_Col.0 -b treat_rdd2   metilene_DMC_input/metilene_DMC_treat_Col-0_rdd2_filtered.input >metilene_DMC_DMR_filtered/metilene_DMC_treat_Col-0_rdd2.DMR
~/tools/metilene_v0.2-7/metilene -t 20 -M 100  -a  mock_Col.0 -b treat_Col.0   metilene_DMC_input/metilene_DMC_Col-0_filtered.input >metilene_DMC_DMR_filtered/metilene_DMC_Col-0.DMR
~/tools/metilene_v0.2-7/metilene -t 20 -M 100  -a  mock_ddm1 -b treat_ddm1   metilene_DMC_input/metilene_DMC_ddm1_filtered.input >metilene_DMC_DMR_filtered/metilene_DMC_ddm1.DMR
~/tools/metilene_v0.2-7/metilene -t 20 -M 100  -a  mock_ibm1.1 -b treat_ibm1.1   metilene_DMC_input/metilene_DMC_ibm1-1_filtered.input >metilene_DMC_DMR_filtered/metilene_DMC_ibm1-1.DMR
~/tools/metilene_v0.2-7/metilene -t 20 -M 100  -a  mock_rdd2 -b treat_rdd2   metilene_DMC_input/metilene_DMC_rdd2_filtered.input >metilene_DMC_DMR_filtered/metilene_DMC_rdd2.DMR
