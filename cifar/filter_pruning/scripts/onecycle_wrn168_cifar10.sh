# prune 1
echo "PRUNE 1" &&
python residualprune.py --dataset cifar10 \
--arch wrn_16_8 \
--model checkpoints/pretrained/cifar10/wrn_16_8/model_best.pth.tar \
--save checkpoints/pruned/cifar10/wrn_16_8/prune_1 &&
# finetune 1
python finetune.py  --refine checkpoints/pruned/cifar10/wrn_16_8/prune_1/pruned.pth.tar \
--dataset cifar10 \
--arch wrn_16_8 \
--save checkpoints/pruned/cifar10/wrn_16_8/prune_1 &&
# prune 2
echo "PRUNE 2" &&
python residualprune.py --dataset cifar10 \
--arch wrn_16_8 \
--model checkpoints/pruned/cifar10/wrn_16_8/prune_1/checkpoint.pth.tar \
--save checkpoints/pruned/cifar10/wrn_16_8/prune_2 &&
# finetune 2
python finetune.py  --refine checkpoints/pruned/cifar10/wrn_16_8/prune_2/pruned.pth.tar \
--dataset cifar10 \
--arch wrn_16_8 \
--save checkpoints/pruned/cifar10/wrn_16_8/prune_2 &&
# prune 3
echo "PRUNE 3" &&
python residualprune.py --dataset cifar10 \
--arch wrn_16_8 \
--model checkpoints/pruned/cifar10/wrn_16_8/prune_2/checkpoint.pth.tar \
--save checkpoints/pruned/cifar10/wrn_16_8/prune_3 &&
# finetune 3
python finetune.py  --refine checkpoints/pruned/cifar10/wrn_16_8/prune_3/pruned.pth.tar \
--dataset cifar10 \
--arch wrn_16_8 \
--save checkpoints/pruned/cifar10/wrn_16_8/prune_3 &&
# prune 4
echo "PRUNE 4" &&
python residualprune.py --dataset cifar10 \
--arch wrn_16_8 \
--model checkpoints/pruned/cifar10/wrn_16_8/prune_3/checkpoint.pth.tar \
--save checkpoints/pruned/cifar10/wrn_16_8/prune_4 &&
# finetune 4
python finetune.py  --refine checkpoints/pruned/cifar10/wrn_16_8/prune_4/pruned.pth.tar \
--dataset cifar10 \
--arch wrn_16_8 \
--save checkpoints/pruned/cifar10/wrn_16_8/prune_4 &&
# prune 5
echo "PRUNE 5" &&
python residualprune.py --dataset cifar10 \
--arch wrn_16_8 \
--model checkpoints/pruned/cifar10/wrn_16_8/prune_4/checkpoint.pth.tar \
--save checkpoints/pruned/cifar10/wrn_16_8/prune_5 &&
# finetune 5
python finetune.py  --refine checkpoints/pruned/cifar10/wrn_16_8/prune_5/pruned.pth.tar \
--dataset cifar10 \
--arch wrn_16_8 \
--save checkpoints/pruned/cifar10/wrn_16_8/prune_5 &&
# ensemble finetune
echo "ENSEMBLE FINETUNE" &&
python ensemble_finetune.py --lr 0.001 \
--batch-size 128 \
--gamma 0.2 \
--schedule 20 30 \
--wd 1e-4 \
--refine checkpoints/pruned/cifar10/wrn_16_8/prune_5/checkpoint.pth.tar \
--dataset cifar10 --save checkpoints/pruned/cifar10/wrn_16_8/snapshot_ensemble --arch wrn_16_8 \
--teachers checkpoints/pruned/cifar10/wrn_16_8/prune_5/checkpoint.pth.tar \
checkpoints/pruned/cifar10/wrn_16_8/prune_4/checkpoint.pth.tar \
checkpoints/pruned/cifar10/wrn_16_8/prune_3/checkpoint.pth.tar \
checkpoints/pruned/cifar10/wrn_16_8/prune_2/checkpoint.pth.tar \
checkpoints/pruned/cifar10/wrn_16_8/prune_1/checkpoint.pth.tar \
checkpoints/pretrained/cifar10/wrn_16_8/model_best.pth.tar