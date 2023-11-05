need_run_config_arr=()
need_run_config_arr+=('p1=amlm-p015-ap06-factor1-1e-4')
for config_name in ${need_run_config_arr[@]}
do
    echo $config_name
    output_path='/path/attempt-code/output/'$config_name
    config_path='/path/attempt-code/config_pretrain/'$config_name'.yaml'
    CUDA_VISIBLE_DEVICES=0,1 python -m tevatron.driver.pretrain \
        --do_train \
        --output_dir ${output_path} \
        --tensorboard_output_dir ${output_path}/tboard \
        --model_name_or_path '' \
        --overwrite_output_dir \
        --fp16 \
        --config_path $config_path \
        > $config_name.log 2>&1
done
sleep 2m
nohup sh pretrain_finetune1_c.sh > 1e-4-2_p1=mlm-d-p015#p2=mt-a01-cate14mul-fix-with-linear#f1=sh#f2=con-no#f3=mt-a0-inherit-linear_e1416.log 2>&1 &
nohup sh pretrain_finetune1.sh > 1e-4-2_p1=mlm-d-p015#p2=mt-a01-cate14mul-fix-with-linear#f1=sh#f2=con-no#f3=mt-a0-inherit-linear_e1820.log 2>&1 &