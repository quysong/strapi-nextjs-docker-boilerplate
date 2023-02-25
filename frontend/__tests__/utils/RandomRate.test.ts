import "@testing-library/jest-dom";
import { randomInRange, randomRate } from "../../utils/RandomRate";

// Tests for randomRate
test('randomRate should generate an integer number between 0 and given array value length', () => {
  const data = [10, 14, 6]; // array for testing
  expect(typeof(randomRate(data))).toBe("number"); // checks the output is a number
  expect(randomRate(data)).toBeGreaterThanOrEqual(0); // checks the output number is greater than or equal to 0
  expect(randomRate(data)).toBeLessThan(data.length); // checks the output number is less than given array value length
});

// Tests for randomInRange
describe('randomInRange', () => {
  it('returns number within min and max values with isRound set to false', () => {
    const min = 0;
    const max = 10;
    const isRound = false;
    const randomNumber = randomInRange(min, max, isRound);
    expect(randomNumber).toBeGreaterThanOrEqual(min);
    expect(randomNumber).toBeLessThanOrEqual(max);
  });
  
  it('returns number within min and max values with isRound set to true', () => {
    const min = 0;
    const max = 10;
    const isRound = true;
    const randomNumber = randomInRange(min, max, isRound);
    expect(randomNumber).toBeGreaterThanOrEqual(min);
    expect(randomNumber).toBeLessThanOrEqual(max);
    expect(randomNumber).toBeGreaterThanOrEqual(Math.floor(min));
    expect(randomNumber).toBeLessThanOrEqual(Math.floor(max));
  });
});