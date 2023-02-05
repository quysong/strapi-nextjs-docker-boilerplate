export const randomInRange = (min: number, max: number, isRound: boolean = false) => {
  if(!isRound) return min + Math.random() * (max - min);

  return Math.floor(min + Math.random() * (max - min));
};

export const randomRate = (data: number[]) => {
  let total: number[] = [];
  data.forEach((item, index) => {
    for (let i = 0; i < item; i++) {
      total.push(index);
    }
  });
  let index = Math.floor(randomInRange(0, total.length - 1));
  return total[index];
};
