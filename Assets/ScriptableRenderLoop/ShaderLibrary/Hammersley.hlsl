#ifndef UNITY_HAMMERSLEY_INCLUDED
#define UNITY_HAMMERSLEY_INCLUDED

// Ref: http://holger.dammertz.org/stuff/notes_HammersleyOnHemisphere.html
uint ReverseBits32(uint bits)
{
#if 1 // Shader model 5
    return reversebits(bits);
#else
    bits = (bits << 16) | (bits >> 16);
    bits = ((bits & 0x00ff00ff) << 8) | ((bits & 0xff00ff00) >> 8);
    bits = ((bits & 0x0f0f0f0f) << 4) | ((bits & 0xf0f0f0f0) >> 4);
    bits = ((bits & 0x33333333) << 2) | ((bits & 0xcccccccc) >> 2);
    bits = ((bits & 0x55555555) << 1) | ((bits & 0xaaaaaaaa) >> 1);
    return bits;
#endif
}

float RadicalInverse_VdC(uint bits)
{
    return float(ReverseBits32(bits)) * 2.3283064365386963e-10; // 0x100000000
}

float2 Hammersley2dSeq(uint i, uint sequenceLength)
{
    return float2(float(i) / float(sequenceLength), RadicalInverse_VdC(i));
}

static const float2 k_Hammersley2dSeq16[] = {
    float2(0.00000000, 0.00000000),
    float2(0.06250000, 0.50000000),
    float2(0.12500000, 0.25000000),
    float2(0.18750000, 0.75000000),
    float2(0.25000000, 0.12500000),
    float2(0.31250000, 0.62500000),
    float2(0.37500000, 0.37500000),
    float2(0.43750000, 0.87500000),
    float2(0.50000000, 0.06250000),
    float2(0.56250000, 0.56250000),
    float2(0.62500000, 0.31250000),
    float2(0.68750000, 0.81250000),
    float2(0.75000000, 0.18750000),
    float2(0.81250000, 0.68750000),
    float2(0.87500000, 0.43750000),
    float2(0.93750000, 0.93750000)
};

static const float2 k_Hammersley2dSeq32[] = {
    float2(0.00000000, 0.00000000),
    float2(0.03125000, 0.50000000),
    float2(0.06250000, 0.25000000),
    float2(0.09375000, 0.75000000),
    float2(0.12500000, 0.12500000),
    float2(0.15625000, 0.62500000),
    float2(0.18750000, 0.37500000),
    float2(0.21875000, 0.87500000),
    float2(0.25000000, 0.06250000),
    float2(0.28125000, 0.56250000),
    float2(0.31250000, 0.31250000),
    float2(0.34375000, 0.81250000),
    float2(0.37500000, 0.18750000),
    float2(0.40625000, 0.68750000),
    float2(0.43750000, 0.43750000),
    float2(0.46875000, 0.93750000),
    float2(0.50000000, 0.03125000),
    float2(0.53125000, 0.53125000),
    float2(0.56250000, 0.28125000),
    float2(0.59375000, 0.78125000),
    float2(0.62500000, 0.15625000),
    float2(0.65625000, 0.65625000),
    float2(0.68750000, 0.40625000),
    float2(0.71875000, 0.90625000),
    float2(0.75000000, 0.09375000),
    float2(0.78125000, 0.59375000),
    float2(0.81250000, 0.34375000),
    float2(0.84375000, 0.84375000),
    float2(0.87500000, 0.21875000),
    float2(0.90625000, 0.71875000),
    float2(0.93750000, 0.46875000),
    float2(0.96875000, 0.96875000)
};

static const float2 k_Hammersley2dSeq64[] = {
    float2(0.00000000, 0.00000000),
    float2(0.01562500, 0.50000000),
    float2(0.03125000, 0.25000000),
    float2(0.04687500, 0.75000000),
    float2(0.06250000, 0.12500000),
    float2(0.07812500, 0.62500000),
    float2(0.09375000, 0.37500000),
    float2(0.10937500, 0.87500000),
    float2(0.12500000, 0.06250000),
    float2(0.14062500, 0.56250000),
    float2(0.15625000, 0.31250000),
    float2(0.17187500, 0.81250000),
    float2(0.18750000, 0.18750000),
    float2(0.20312500, 0.68750000),
    float2(0.21875000, 0.43750000),
    float2(0.23437500, 0.93750000),
    float2(0.25000000, 0.03125000),
    float2(0.26562500, 0.53125000),
    float2(0.28125000, 0.28125000),
    float2(0.29687500, 0.78125000),
    float2(0.31250000, 0.15625000),
    float2(0.32812500, 0.65625000),
    float2(0.34375000, 0.40625000),
    float2(0.35937500, 0.90625000),
    float2(0.37500000, 0.09375000),
    float2(0.39062500, 0.59375000),
    float2(0.40625000, 0.34375000),
    float2(0.42187500, 0.84375000),
    float2(0.43750000, 0.21875000),
    float2(0.45312500, 0.71875000),
    float2(0.46875000, 0.46875000),
    float2(0.48437500, 0.96875000),
    float2(0.50000000, 0.01562500),
    float2(0.51562500, 0.51562500),
    float2(0.53125000, 0.26562500),
    float2(0.54687500, 0.76562500),
    float2(0.56250000, 0.14062500),
    float2(0.57812500, 0.64062500),
    float2(0.59375000, 0.39062500),
    float2(0.60937500, 0.89062500),
    float2(0.62500000, 0.07812500),
    float2(0.64062500, 0.57812500),
    float2(0.65625000, 0.32812500),
    float2(0.67187500, 0.82812500),
    float2(0.68750000, 0.20312500),
    float2(0.70312500, 0.70312500),
    float2(0.71875000, 0.45312500),
    float2(0.73437500, 0.95312500),
    float2(0.75000000, 0.04687500),
    float2(0.76562500, 0.54687500),
    float2(0.78125000, 0.29687500),
    float2(0.79687500, 0.79687500),
    float2(0.81250000, 0.17187500),
    float2(0.82812500, 0.67187500),
    float2(0.84375000, 0.42187500),
    float2(0.85937500, 0.92187500),
    float2(0.87500000, 0.10937500),
    float2(0.89062500, 0.60937500),
    float2(0.90625000, 0.35937500),
    float2(0.92187500, 0.85937500),
    float2(0.93750000, 0.23437500),
    float2(0.95312500, 0.73437500),
    float2(0.96875000, 0.48437500),
    float2(0.98437500, 0.98437500)
};

static const float2 k_Hammersley2dSeq256[] = {
    float2(0.00000000, 0.00000000),
    float2(0.00390625, 0.50000000),
    float2(0.00781250, 0.25000000),
    float2(0.01171875, 0.75000000),
    float2(0.01562500, 0.12500000),
    float2(0.01953125, 0.62500000),
    float2(0.02343750, 0.37500000),
    float2(0.02734375, 0.87500000),
    float2(0.03125000, 0.06250000),
    float2(0.03515625, 0.56250000),
    float2(0.03906250, 0.31250000),
    float2(0.04296875, 0.81250000),
    float2(0.04687500, 0.18750000),
    float2(0.05078125, 0.68750000),
    float2(0.05468750, 0.43750000),
    float2(0.05859375, 0.93750000),
    float2(0.06250000, 0.03125000),
    float2(0.06640625, 0.53125000),
    float2(0.07031250, 0.28125000),
    float2(0.07421875, 0.78125000),
    float2(0.07812500, 0.15625000),
    float2(0.08203125, 0.65625000),
    float2(0.08593750, 0.40625000),
    float2(0.08984375, 0.90625000),
    float2(0.09375000, 0.09375000),
    float2(0.09765625, 0.59375000),
    float2(0.10156250, 0.34375000),
    float2(0.10546875, 0.84375000),
    float2(0.10937500, 0.21875000),
    float2(0.11328125, 0.71875000),
    float2(0.11718750, 0.46875000),
    float2(0.12109375, 0.96875000),
    float2(0.12500000, 0.01562500),
    float2(0.12890625, 0.51562500),
    float2(0.13281250, 0.26562500),
    float2(0.13671875, 0.76562500),
    float2(0.14062500, 0.14062500),
    float2(0.14453125, 0.64062500),
    float2(0.14843750, 0.39062500),
    float2(0.15234375, 0.89062500),
    float2(0.15625000, 0.07812500),
    float2(0.16015625, 0.57812500),
    float2(0.16406250, 0.32812500),
    float2(0.16796875, 0.82812500),
    float2(0.17187500, 0.20312500),
    float2(0.17578125, 0.70312500),
    float2(0.17968750, 0.45312500),
    float2(0.18359375, 0.95312500),
    float2(0.18750000, 0.04687500),
    float2(0.19140625, 0.54687500),
    float2(0.19531250, 0.29687500),
    float2(0.19921875, 0.79687500),
    float2(0.20312500, 0.17187500),
    float2(0.20703125, 0.67187500),
    float2(0.21093750, 0.42187500),
    float2(0.21484375, 0.92187500),
    float2(0.21875000, 0.10937500),
    float2(0.22265625, 0.60937500),
    float2(0.22656250, 0.35937500),
    float2(0.23046875, 0.85937500),
    float2(0.23437500, 0.23437500),
    float2(0.23828125, 0.73437500),
    float2(0.24218750, 0.48437500),
    float2(0.24609375, 0.98437500),
    float2(0.25000000, 0.00781250),
    float2(0.25390625, 0.50781250),
    float2(0.25781250, 0.25781250),
    float2(0.26171875, 0.75781250),
    float2(0.26562500, 0.13281250),
    float2(0.26953125, 0.63281250),
    float2(0.27343750, 0.38281250),
    float2(0.27734375, 0.88281250),
    float2(0.28125000, 0.07031250),
    float2(0.28515625, 0.57031250),
    float2(0.28906250, 0.32031250),
    float2(0.29296875, 0.82031250),
    float2(0.29687500, 0.19531250),
    float2(0.30078125, 0.69531250),
    float2(0.30468750, 0.44531250),
    float2(0.30859375, 0.94531250),
    float2(0.31250000, 0.03906250),
    float2(0.31640625, 0.53906250),
    float2(0.32031250, 0.28906250),
    float2(0.32421875, 0.78906250),
    float2(0.32812500, 0.16406250),
    float2(0.33203125, 0.66406250),
    float2(0.33593750, 0.41406250),
    float2(0.33984375, 0.91406250),
    float2(0.34375000, 0.10156250),
    float2(0.34765625, 0.60156250),
    float2(0.35156250, 0.35156250),
    float2(0.35546875, 0.85156250),
    float2(0.35937500, 0.22656250),
    float2(0.36328125, 0.72656250),
    float2(0.36718750, 0.47656250),
    float2(0.37109375, 0.97656250),
    float2(0.37500000, 0.02343750),
    float2(0.37890625, 0.52343750),
    float2(0.38281250, 0.27343750),
    float2(0.38671875, 0.77343750),
    float2(0.39062500, 0.14843750),
    float2(0.39453125, 0.64843750),
    float2(0.39843750, 0.39843750),
    float2(0.40234375, 0.89843750),
    float2(0.40625000, 0.08593750),
    float2(0.41015625, 0.58593750),
    float2(0.41406250, 0.33593750),
    float2(0.41796875, 0.83593750),
    float2(0.42187500, 0.21093750),
    float2(0.42578125, 0.71093750),
    float2(0.42968750, 0.46093750),
    float2(0.43359375, 0.96093750),
    float2(0.43750000, 0.05468750),
    float2(0.44140625, 0.55468750),
    float2(0.44531250, 0.30468750),
    float2(0.44921875, 0.80468750),
    float2(0.45312500, 0.17968750),
    float2(0.45703125, 0.67968750),
    float2(0.46093750, 0.42968750),
    float2(0.46484375, 0.92968750),
    float2(0.46875000, 0.11718750),
    float2(0.47265625, 0.61718750),
    float2(0.47656250, 0.36718750),
    float2(0.48046875, 0.86718750),
    float2(0.48437500, 0.24218750),
    float2(0.48828125, 0.74218750),
    float2(0.49218750, 0.49218750),
    float2(0.49609375, 0.99218750),
    float2(0.50000000, 0.00390625),
    float2(0.50390625, 0.50390625),
    float2(0.50781250, 0.25390625),
    float2(0.51171875, 0.75390625),
    float2(0.51562500, 0.12890625),
    float2(0.51953125, 0.62890625),
    float2(0.52343750, 0.37890625),
    float2(0.52734375, 0.87890625),
    float2(0.53125000, 0.06640625),
    float2(0.53515625, 0.56640625),
    float2(0.53906250, 0.31640625),
    float2(0.54296875, 0.81640625),
    float2(0.54687500, 0.19140625),
    float2(0.55078125, 0.69140625),
    float2(0.55468750, 0.44140625),
    float2(0.55859375, 0.94140625),
    float2(0.56250000, 0.03515625),
    float2(0.56640625, 0.53515625),
    float2(0.57031250, 0.28515625),
    float2(0.57421875, 0.78515625),
    float2(0.57812500, 0.16015625),
    float2(0.58203125, 0.66015625),
    float2(0.58593750, 0.41015625),
    float2(0.58984375, 0.91015625),
    float2(0.59375000, 0.09765625),
    float2(0.59765625, 0.59765625),
    float2(0.60156250, 0.34765625),
    float2(0.60546875, 0.84765625),
    float2(0.60937500, 0.22265625),
    float2(0.61328125, 0.72265625),
    float2(0.61718750, 0.47265625),
    float2(0.62109375, 0.97265625),
    float2(0.62500000, 0.01953125),
    float2(0.62890625, 0.51953125),
    float2(0.63281250, 0.26953125),
    float2(0.63671875, 0.76953125),
    float2(0.64062500, 0.14453125),
    float2(0.64453125, 0.64453125),
    float2(0.64843750, 0.39453125),
    float2(0.65234375, 0.89453125),
    float2(0.65625000, 0.08203125),
    float2(0.66015625, 0.58203125),
    float2(0.66406250, 0.33203125),
    float2(0.66796875, 0.83203125),
    float2(0.67187500, 0.20703125),
    float2(0.67578125, 0.70703125),
    float2(0.67968750, 0.45703125),
    float2(0.68359375, 0.95703125),
    float2(0.68750000, 0.05078125),
    float2(0.69140625, 0.55078125),
    float2(0.69531250, 0.30078125),
    float2(0.69921875, 0.80078125),
    float2(0.70312500, 0.17578125),
    float2(0.70703125, 0.67578125),
    float2(0.71093750, 0.42578125),
    float2(0.71484375, 0.92578125),
    float2(0.71875000, 0.11328125),
    float2(0.72265625, 0.61328125),
    float2(0.72656250, 0.36328125),
    float2(0.73046875, 0.86328125),
    float2(0.73437500, 0.23828125),
    float2(0.73828125, 0.73828125),
    float2(0.74218750, 0.48828125),
    float2(0.74609375, 0.98828125),
    float2(0.75000000, 0.01171875),
    float2(0.75390625, 0.51171875),
    float2(0.75781250, 0.26171875),
    float2(0.76171875, 0.76171875),
    float2(0.76562500, 0.13671875),
    float2(0.76953125, 0.63671875),
    float2(0.77343750, 0.38671875),
    float2(0.77734375, 0.88671875),
    float2(0.78125000, 0.07421875),
    float2(0.78515625, 0.57421875),
    float2(0.78906250, 0.32421875),
    float2(0.79296875, 0.82421875),
    float2(0.79687500, 0.19921875),
    float2(0.80078125, 0.69921875),
    float2(0.80468750, 0.44921875),
    float2(0.80859375, 0.94921875),
    float2(0.81250000, 0.04296875),
    float2(0.81640625, 0.54296875),
    float2(0.82031250, 0.29296875),
    float2(0.82421875, 0.79296875),
    float2(0.82812500, 0.16796875),
    float2(0.83203125, 0.66796875),
    float2(0.83593750, 0.41796875),
    float2(0.83984375, 0.91796875),
    float2(0.84375000, 0.10546875),
    float2(0.84765625, 0.60546875),
    float2(0.85156250, 0.35546875),
    float2(0.85546875, 0.85546875),
    float2(0.85937500, 0.23046875),
    float2(0.86328125, 0.73046875),
    float2(0.86718750, 0.48046875),
    float2(0.87109375, 0.98046875),
    float2(0.87500000, 0.02734375),
    float2(0.87890625, 0.52734375),
    float2(0.88281250, 0.27734375),
    float2(0.88671875, 0.77734375),
    float2(0.89062500, 0.15234375),
    float2(0.89453125, 0.65234375),
    float2(0.89843750, 0.40234375),
    float2(0.90234375, 0.90234375),
    float2(0.90625000, 0.08984375),
    float2(0.91015625, 0.58984375),
    float2(0.91406250, 0.33984375),
    float2(0.91796875, 0.83984375),
    float2(0.92187500, 0.21484375),
    float2(0.92578125, 0.71484375),
    float2(0.92968750, 0.46484375),
    float2(0.93359375, 0.96484375),
    float2(0.93750000, 0.05859375),
    float2(0.94140625, 0.55859375),
    float2(0.94531250, 0.30859375),
    float2(0.94921875, 0.80859375),
    float2(0.95312500, 0.18359375),
    float2(0.95703125, 0.68359375),
    float2(0.96093750, 0.43359375),
    float2(0.96484375, 0.93359375),
    float2(0.96875000, 0.12109375),
    float2(0.97265625, 0.62109375),
    float2(0.97656250, 0.37109375),
    float2(0.98046875, 0.87109375),
    float2(0.98437500, 0.24609375),
    float2(0.98828125, 0.74609375),
    float2(0.99218750, 0.49609375),
    float2(0.99609375, 0.99609375)
};

// Loads elements from one of the precomputed tables for sequence lengths of 16, 32, 64, 256.
// Computes the values at runtime otherwise.
// For sampling, the size of the point set is the same as the sequence length.
float2 Hammersley2d(uint i, uint sequenceLength)
{
    switch (sequenceLength)
    {
        case 16:  return k_Hammersley2dSeq16[i];
        case 32:  return k_Hammersley2dSeq32[i];
        case 64:  return k_Hammersley2dSeq64[i];
        case 256: return k_Hammersley2dSeq256[i];
        default:  return Hammersley2dSeq(i, sequenceLength);
    }
}

#endif // UNITY_HAMMERSLEY_INCLUDED
